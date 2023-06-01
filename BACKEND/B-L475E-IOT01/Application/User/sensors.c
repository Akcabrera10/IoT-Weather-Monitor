/**
******************************************************************************
* @file    BSP/Src/sensors.c 
* @author  MCD Application Team
* @brief   This example code shows how to use the QSPI Driver
******************************************************************************
* @attention
*
* Copyright (c) 2017 STMicroelectronics.
* All rights reserved.
*
* This software is licensed under terms that can be found in the LICENSE file
* in the root directory of this software component.
* If no LICENSE file comes with this software, it is provided AS-IS.
*
******************************************************************************
*/

/* Includes ------------------------------------------------------------------*/
#include "main.h"

/** @addtogroup STM32L4xx_HAL_Examples
* @{
*/

/** @addtogroup BSP
* @{
*/ 

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
float pDataXYZ[3] = {0};
float mDataXYZ[3] = {0};
float gyroDataXYZ[3] = {0};

/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Test of LPS22HB pressure sensor.
  */
float Pressure_Test(void)
{
  uint32_t ret = 0;
  float press_value = 0;
  
  BSP_PSENSOR_Init();
  press_value = BSP_PSENSOR_ReadPressure();
  return press_value;

}

/**
  * @brief  Test of HTS221 humidity sensor.
  */
float Humidity_Test(void)
{
  uint32_t ret = 0;
  float humidity_value = 0;

  BSP_HSENSOR_Init();
  humidity_value = BSP_HSENSOR_ReadHumidity();
  return humidity_value;

}

/**
  * @brief  Test of HTS221 and LPS22HB temperature sensors.
  */
float Temperature_Test(void)
{
  uint32_t ret = 0;
  float temp_value = 0;

  BSP_TSENSOR_Init();
#ifdef USE_LPS22HB_TEMP

#else /* USE_HTS221_TEMP */

#endif

   temp_value = BSP_TSENSOR_ReadTemp();
   return temp_value;
}

/**
  * @brief  Test of LSM6DSL accelerometer sensor.
  */
void Accelero_Test(float* accelData)
{
  uint32_t ret = 0;

  BSP_ACCELERO_Init();
  BSP_ACCELERO_AccGetXYZ(pDataXYZ);
  accelData[0] = pDataXYZ[0];
  accelData[1] = pDataXYZ[1];
  accelData[2] = pDataXYZ[2];
  BSP_ACCELERO_DeInit();

}

/**
  * @brief  Test of LIS3MDL gyroscope sensor.
  */
void Gyro_Test(float* gyroData)
{
      BSP_GYRO_Init();
      BSP_GYRO_GetXYZ(gyroDataXYZ);
      gyroData[0] = gyroDataXYZ[0];
      gyroData[1] = gyroDataXYZ[1];
      gyroData[2] = gyroDataXYZ[2];
      BSP_GYRO_DeInit();
}

/**
  * @brief  Test of LIS3MDL magnetometer sensor.
  */
void Magneto_Test(float* magData)
{
  uint32_t ret = 0;
  BSP_MAGNETO_Init();
  BSP_MAGNETO_GetXYZ(mDataXYZ);
  magData[0] = mDataXYZ[0];
  magData[1] = mDataXYZ[1];
  magData[2] = mDataXYZ[2];
  BSP_MAGNETO_DeInit();
  
}

/**
* @}
*/ 

/**
* @}
*/ 
