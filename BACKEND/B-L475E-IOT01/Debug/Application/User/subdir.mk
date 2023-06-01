################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Arvyn/Desktop/STM32CubeL4-master/Projects/B-L475E-IOT01A/Applications/WiFi/WiFi_Client_Server/Src/main.c \
../Application/User/sensors.c \
C:/Users/Arvyn/Desktop/STM32CubeL4-master/Projects/B-L475E-IOT01A/Applications/WiFi/WiFi_Client_Server/Src/stm32l4xx_it.c 

OBJS += \
./Application/User/main.o \
./Application/User/sensors.o \
./Application/User/stm32l4xx_it.o 

C_DEPS += \
./Application/User/main.d \
./Application/User/sensors.d \
./Application/User/stm32l4xx_it.d 


# Each subdirectory must supply rules for building sources it contributes
Application/User/main.o: C:/Users/Arvyn/Desktop/STM32CubeL4-master/Projects/B-L475E-IOT01A/Applications/WiFi/WiFi_Client_Server/Src/main.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L475xx -DUSE_STM32L475_DISCOVERY -c -I../../../Inc -I"C:/Users/Arvyn/Desktop/STM32CubeL4-master/Drivers/BSP/Components/hts221" -I"C:/Users/Arvyn/Desktop/STM32CubeL4-master/Drivers/BSP/Components/lis3mdl" -I"C:/Users/Arvyn/Desktop/STM32CubeL4-master/Drivers/BSP/Components/lps22hb" -I"C:/Users/Arvyn/Desktop/STM32CubeL4-master/Drivers/BSP/Components/lsm6dsl" -I../../../../Common/Inc -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../../../../../../../../Drivers/STM32L4xx_HAL_Driver/Inc -I../../../../../../../../Drivers/BSP/B-L475E-IOT01 -I../../../../../../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -Wno-strict-aliasing -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/%.o Application/User/%.su Application/User/%.cyclo: ../Application/User/%.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L475xx -DUSE_STM32L475_DISCOVERY -c -I../../../Inc -I"C:/Users/Arvyn/Desktop/STM32CubeL4-master/Drivers/BSP/Components/hts221" -I"C:/Users/Arvyn/Desktop/STM32CubeL4-master/Drivers/BSP/Components/lis3mdl" -I"C:/Users/Arvyn/Desktop/STM32CubeL4-master/Drivers/BSP/Components/lps22hb" -I"C:/Users/Arvyn/Desktop/STM32CubeL4-master/Drivers/BSP/Components/lsm6dsl" -I../../../../Common/Inc -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../../../../../../../../Drivers/STM32L4xx_HAL_Driver/Inc -I../../../../../../../../Drivers/BSP/B-L475E-IOT01 -I../../../../../../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -Wno-strict-aliasing -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/stm32l4xx_it.o: C:/Users/Arvyn/Desktop/STM32CubeL4-master/Projects/B-L475E-IOT01A/Applications/WiFi/WiFi_Client_Server/Src/stm32l4xx_it.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L475xx -DUSE_STM32L475_DISCOVERY -c -I../../../Inc -I"C:/Users/Arvyn/Desktop/STM32CubeL4-master/Drivers/BSP/Components/hts221" -I"C:/Users/Arvyn/Desktop/STM32CubeL4-master/Drivers/BSP/Components/lis3mdl" -I"C:/Users/Arvyn/Desktop/STM32CubeL4-master/Drivers/BSP/Components/lps22hb" -I"C:/Users/Arvyn/Desktop/STM32CubeL4-master/Drivers/BSP/Components/lsm6dsl" -I../../../../Common/Inc -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../../../../../../../../Drivers/STM32L4xx_HAL_Driver/Inc -I../../../../../../../../Drivers/BSP/B-L475E-IOT01 -I../../../../../../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -Wno-strict-aliasing -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Application-2f-User

clean-Application-2f-User:
	-$(RM) ./Application/User/main.cyclo ./Application/User/main.d ./Application/User/main.o ./Application/User/main.su ./Application/User/sensors.cyclo ./Application/User/sensors.d ./Application/User/sensors.o ./Application/User/sensors.su ./Application/User/stm32l4xx_it.cyclo ./Application/User/stm32l4xx_it.d ./Application/User/stm32l4xx_it.o ./Application/User/stm32l4xx_it.su

.PHONY: clean-Application-2f-User

