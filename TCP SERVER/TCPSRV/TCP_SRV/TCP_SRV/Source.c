#undef UNICODE

#define WIN32_LEAN_AND_MEAN

#include <windows.h>
#include <winsock2.h>
#include <ws2tcpip.h>
#include <stdlib.h>
#include <stdio.h>
#include <winsock2.h>
#include <sqlite3.h>

// Need to link with Ws2_32.lib
#pragma comment (lib, "Ws2_32.lib")
#pragma comment (lib, "sqlite3.c")
// #pragma comment (lib, "Mswsock.lib")
float received_float;

#define DEFAULT_BUFLEN 512
#define DEFAULT_PORT "4545"
#define DATABASE_NAME "C:\xampp\htdocs\final\final.db"

int __cdecl main(void)
{
    WSADATA wsaData;
    int iResult;
    int iResultSQL;

    SOCKET ListenSocket = INVALID_SOCKET;
    SOCKET ClientSocket = INVALID_SOCKET;

    struct addrinfo* result = NULL;
    struct addrinfo hints;

    int iSendResult;
    char recvbuf[DEFAULT_BUFLEN];
    int recvbuflen = DEFAULT_BUFLEN;

    sqlite3* db;
    char* err_msg = 0;

    // Initialize Winsock
    iResult = WSAStartup(MAKEWORD(2, 2), &wsaData);
    if (iResult != 0) {
        printf("WSAStartup failed with error: %d\n", iResult);
        return 1;
    }

    ZeroMemory(&hints, sizeof(hints));
    hints.ai_family = AF_INET;
    hints.ai_socktype = SOCK_STREAM;
    hints.ai_protocol = IPPROTO_TCP;
    hints.ai_flags = AI_PASSIVE;

    // Resolve the server address and port
    iResult = getaddrinfo(NULL, DEFAULT_PORT, &hints, &result);
    if (iResult != 0) {
        printf("getaddrinfo failed with error: %d\n", iResult);
        WSACleanup();
        return 1;
    }

    // Create a SOCKET for the server to listen for client connections.
    ListenSocket = socket(result->ai_family, result->ai_socktype, result->ai_protocol);
    if (ListenSocket == INVALID_SOCKET) {
        printf("socket failed with error: %ld\n", WSAGetLastError());
        freeaddrinfo(result);
        WSACleanup();
        return 1;
    }

    // Setup the TCP listening socket
    iResult = bind(ListenSocket, result->ai_addr, (int)result->ai_addrlen);
    if (iResult == SOCKET_ERROR) {
        printf("bind failed with error: %d\n", WSAGetLastError());
        freeaddrinfo(result);
        closesocket(ListenSocket);
        WSACleanup();
        return 1;
    }

    freeaddrinfo(result);

    iResult = listen(ListenSocket, SOMAXCONN);
    if (iResult == SOCKET_ERROR) {
        printf("listen failed with error: %d\n", WSAGetLastError());
        closesocket(ListenSocket);

        WSACleanup();
        return 1;
    }

    // Open the SQLite database
    iResult = sqlite3_open("C:/xampp/htdocs/final/final.db", &db);
    if (iResult != SQLITE_OK) {
        printf("Could not open database: %s\n", sqlite3_errmsg(db));
        sqlite3_close(db);
        return 1;
    }

    // Create the table if it does not already exist
    const char* create_table_query = "CREATE TABLE IF NOT EXISTS data ("
        "id INTEGER PRIMARY KEY,"
        "temperature REAL NOT NULL,"
        "gyro_x REAL NOT NULL,"
        "gyro_y REAL NOT NULL,"
        "gyro_z REAL NOT NULL,"
        "humidity REAL NOT NULL,"
        "pressure REAL NOT NULL,"
        "accel_x REAL NOT NULL,"
        "accel_y REAL NOT NULL,"
        "accel_z REAL NOT NULL,"
        "mag_x REAL NOT NULL,"
        "mag_y REAL NOT NULL,"
        "mag_z REAL NOT NULL,"
        "timestamp DATETIME DEFAULT CURRENT_TIMESTAMP);";

    iResult = sqlite3_exec(db, create_table_query, 0, 0, &err_msg);
    if (iResult != SQLITE_OK) {
        printf("SQL error: %s\n", err_msg);
        sqlite3_free(err_msg);
        sqlite3_close(db);
        return 1;
    }

    // Accept a client socket
    ClientSocket = accept(ListenSocket, NULL, NULL);
    if (ClientSocket == INVALID_SOCKET) {
        printf("accept failed with error: %d\n", WSAGetLastError());
        closesocket(ListenSocket);
        WSACleanup();
        return 1;
    }

    // No longer need server socket
    closesocket(ListenSocket);
      char* context = NULL;
    // Receive until the peer shuts down the connection
    do {
        iResult = recv(ClientSocket, recvbuf, DEFAULT_BUFLEN, 0);
        if (iResult > 0) {

            // Split the received data into separate values
            char* temp = strtok_s(recvbuf, ",", &context);
            char* gyroX = strtok_s(NULL, ",", &context);
            char* gyroY = strtok_s(NULL, ",", &context);
            char* gyroZ = strtok_s(NULL, ",", &context);
            char* humid = strtok_s(NULL, ",", &context);
            char* press = strtok_s(NULL, ",", &context);
            char* accelX = strtok_s(NULL, ",", &context);
            char* accelY = strtok_s(NULL, ",", &context);
            char* accelZ = strtok_s(NULL, ",", &context);
            char* magX = strtok_s(NULL, ",", &context);
            char* magY = strtok_s(NULL, ",", &context);
            char* magZ = strtok_s(NULL, ",", &context);


            printf("Temperature: %s\n", temp);
            printf("Gyro X: %s\n", gyroX);
            printf("Gyro Y: %s\n", gyroY);
            printf("Gyro Z: %s\n", gyroZ);
            printf("Humidity: %s\n", humid);
            printf("Pressure: %s\n", press);
            printf("Accelerometer X: %s\n", accelX);
            printf("Accelerometer Y: %s\n", accelY);
            printf("Accelerometer Z: %s\n", accelZ);
            printf("Magnetometer X: %s\n", magX);
            printf("Magnetometer X: %s\n", magY);
            printf("Magnetometer X: %s\n", magZ);

            printf("Bytes received: %d\n", iResult);

            char sql[DEFAULT_BUFLEN];
            sprintf_s(sql, DEFAULT_BUFLEN, "INSERT INTO data (temperature, gyro_x, gyro_y, gyro_z, humidity, pressure, accel_x, accel_y, accel_z, mag_x, mag_y, mag_z) VALUES ('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s');", temp, gyroX, gyroY, gyroZ, humid, press, accelX, accelY, accelZ, magX, magY, magZ);


            iResultSQL = sqlite3_exec(db, sql, 0, 0, &err_msg);
            if (iResultSQL != SQLITE_OK) {
                printf("SQL error: %s\n", err_msg);
                sqlite3_free(err_msg);
            }

        }
        else if (iResult == 0)
            printf("Connection closing...\n");
        else {
            printf("recv failed with error: %d\n", WSAGetLastError());
            closesocket(ClientSocket);
            WSACleanup();
            return 1;
        }
    } while (iResult > 0);



    // shutdown the connection since we're done
    iResult = shutdown(ClientSocket, SD_SEND);
    if (iResult == SOCKET_ERROR) {
        printf("shutdown failed with error: %d\n", WSAGetLastError());
        closesocket(ClientSocket);
        WSACleanup();
        return 1;
    }

    // cleanup
    closesocket(ClientSocket);
    WSACleanup();

    return 0;

}