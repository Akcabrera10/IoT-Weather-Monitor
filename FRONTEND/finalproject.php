<!DOCTYPE html>
<html>
<head>
	<title>Sensor Data Navigation</title>
	<style type="text/css">
		body {
			display: flex;
			flex-direction: column;
			align-items: center;
			justify-content: center;
			height: 100vh;
			margin: 0;
			font-family: Arial, sans-serif;
			align-text: center;
		}
		fieldset {
			padding: 20px;
			border: 1px solid black;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			margin-bottom: 20px;
			display: flex;
			flex-direction: column;
			align-items: center;
			
		}
		fieldset legend {
			font-size: 18px;
			font-weight: bold;
			margin-bottom: 10px;
		}
		form {
			display: flex;
			flex-direction: column;
			align-items: center;
		}
		p{
			display: flex;
			flex-direction: column;
			align-items: center;
			justify-content: center;
			height: 100vh;
			margin: 0;
			font-family: Arial, sans-serif;
			align-text: center;
		}
			
		label {
			font-weight: bold;
			margin-right: 10px;
		}
		select {
			margin-right: 10px;
		}
		.buttons {
			display: flex;
			flex-direction: row;
			margin-top: 10px;
		}
		button {
			background-color: #4CAF50;
			color: white;
			border: none;
			padding: 10px 20px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			margin: 4px 2px;
			cursor: pointer;
			border-radius: 4px;
		}
		button:hover {
			background-color: #3e8e41;
		}
		table {
			border-collapse: collapse;
			margin-top: 20px;
		}
		th, td {
			border: 1px solid #ddd;
			padding: 8px;
			text-align: center;
		}
		th {
			background-color: #f2f2f2;
			font-weight: bold;
		}
        .sensor-buttons {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }
        .sensor-buttons button {
            margin-right: 10px;
        }
	</style>
</head>
<body>
    <fieldset>
        <legend>Sensor Data Navigation</legend>
        <div class="sensor-buttons">
			<button type="button" onclick="window.location.href='finalproject.php?sensor=home'">Home</button>
            <button type="button" onclick="window.location.href='finalproject.php?sensor=temperature'">Temperature</button>
            <button type="button" onclick="window.location.href='finalproject.php?sensor=humidity'">Humidity</button>
            <button type="button" onclick="window.location.href='finalproject.php?sensor=pressure'">Pressure</button>
            <button type="button" onclick="window.location.href='finalproject.php?sensor=magnetometer'">Magnetometer</button>
            <button type="button" onclick="window.location.href='finalproject.php?sensor=accelerometer'">Accelerometer</button>
            <button type="button" onclick="window.location.href='finalproject.php?sensor=gyroscope'">Gyroscope</button>
			<button type="button" onclick="window.location.href='finalproject.php?sensor=reset'">Reset</button>
        </div>
    </fieldset>
	<div id="table_div">
        <?php
            // Open the database file
$db = new SQLite3('C:/xampp/htdocs/final/final.db');

// Define the query to retrieve the sensor data
$sensor_query = "";

if(isset($_GET['sensor'])) {
    $sensor = $_GET['sensor'];
    switch($sensor) {
        case "temperature":
            $sensor_query = "SELECT * FROM data ORDER BY timestamp ASC";
            $sensor_name = "Temperature";
            break;

        case "humidity":
            $sensor_query = "SELECT * FROM data ORDER BY timestamp ASC";
            $sensor_name = "Humidity";
            break;
        case "pressure":
            $sensor_query = "SELECT * FROM data ORDER BY timestamp ASC";
            $sensor_name = "Pressure";
            break;
        case "magnetometer":
            $sensor_query = "SELECT id, mag_x, mag_y, mag_z, timestamp FROM data ORDER BY timestamp ASC";
            $sensor_name = "Magnetometer";
            break;
        case "accelerometer":
            $sensor_query = "SELECT id, accel_x, accel_y, accel_z, timestamp FROM data ORDER BY timestamp ASC";
            $sensor_name = "Accelerometer";
            break;
        case "gyroscope":
            $sensor_query = "SELECT id, gyro_x, gyro_y, gyro_z, timestamp FROM data ORDER BY timestamp ASC";
            $sensor_name = "Gyroscope";
            break;
		case "reset":
		    $sensor_query = "DELETE FROM data";
            $sensor_name = "reset";
			break;
		
        default:
            $sensor_query = "SELECT * FROM home";
            $sensor_name = "Home";
            break;
    }
}
else {
    $sensor_query = "SELECT * FROM home";
    $sensor_name = "home";
}

// Execute the query to retrieve the sensor data
$results = $db->query($sensor_query);
echo"<fieldset>";
		if ($sensor_name !== "Home") {
           // Start building the HTML table
            echo "<div class='section'>";
            echo "<h2>$sensor_name</h2>";
            echo "<table>";
            
            if ($sensor == "magnetometer") {
                echo "<tr><th>ID</th><th>Timestamp</th><th>mag_x</th><th>mag_y</th><th>mag_z</th></tr>";
            } elseif ($sensor == "accelerometer") {
                echo "<tr><th>ID</th><th>Timestamp</th><th>accel_x</th><th>accel_y</th><th>accel_z</th></tr>";
            } elseif ($sensor == "gyroscope") {
                echo "<tr><th>ID</th><th>Timestamp</th><th>gyro_x</th><th>gyro_y</th><th>gyro_z</th></tr>";
            } else {
                echo "<tr><th>ID</th><th>Timestamp</th><th>$sensor_name</th></tr>";
            }

// Loop through the results and add a row to the table for each one
        while ($row = $results->fetchArray()) {
            $id = $row['id'];
            $timestamp = $row['timestamp'];
            
            if ($sensor == "magnetometer") {
                $mag_x = $row['mag_x'];
                $mag_y = $row['mag_y'];
                $mag_z = $row['mag_z'];
                echo "<tr><td>$id</td><td>$timestamp</td><td>$mag_x</td><td>$mag_y</td><td>$mag_z</td></tr>";
            } elseif ($sensor == "accelerometer") {
                $accel_x = $row['accel_x'];
                $accel_y = $row['accel_y'];
                $accel_z = $row['accel_z'];
                echo "<tr><td>$id</td><td>$timestamp</td><td>$accel_x</td><td>$accel_y</td><td>$accel_z</td></tr>";
            } elseif ($sensor == "gyroscope") {
                $gyro_x = $row['gyro_x'];
                $gyro_y = $row['gyro_y'];
                $gyro_z = $row['gyro_z'];
                echo "<tr><td>$id</td><td>$timestamp</td><td>$gyro_x</td><td>$gyro_y</td><td>$gyro_z</td></tr>";
            } else {
                $sensor_value = $row[$sensor];
                echo "<tr><td>$id</td><td>$timestamp</td><td>$sensor_value</td></tr>";
            }
        }
		}
			
echo "</table>";
if ($sensor_name == "Home") {
echo "<legend> NEHD Project, Created by Arvyn cabrera </legend>";
echo "This website is hosted on XAMPP to display sensor values from the <strong>STM32l475E-Discovery Kit microcontroller.</strong>";
echo "<br>";
echo "It tracks data from the microcontroller in real-time, saved in a SQLite database with a delay of 3 seconds.";

}
echo "</fieldset>";
echo "</div>";

        ?>
    </div>
</body>
</html>
