################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
C:/Users/Arvyn/Desktop/STM32CubeL4-master/Projects/B-L475E-IOT01A/Applications/WiFi/WiFi_Client_Server/SW4STM32/startup_stm32l475xx.s 

C_SRCS += \
C:/Users/Arvyn/Desktop/STM32CubeL4-master/Projects/B-L475E-IOT01A/Applications/WiFi/WiFi_Client_Server/SW4STM32/syscalls.c 

OBJS += \
./SW4STM32/startup_stm32l475xx.o \
./SW4STM32/syscalls.o 

S_DEPS += \
./SW4STM32/startup_stm32l475xx.d 

C_DEPS += \
./SW4STM32/syscalls.d 


# Each subdirectory must supply rules for building sources it contributes
SW4STM32/startup_stm32l475xx.o: C:/Users/Arvyn/Desktop/STM32CubeL4-master/Projects/B-L475E-IOT01A/Applications/WiFi/WiFi_Client_Server/SW4STM32/startup_stm32l475xx.s SW4STM32/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
SW4STM32/syscalls.o: C:/Users/Arvyn/Desktop/STM32CubeL4-master/Projects/B-L475E-IOT01A/Applications/WiFi/WiFi_Client_Server/SW4STM32/syscalls.c SW4STM32/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L475xx -DUSE_STM32L475_DISCOVERY -c -I../../../Inc -I"C:/Users/Arvyn/Desktop/STM32CubeL4-master/Drivers/BSP/Components/hts221" -I"C:/Users/Arvyn/Desktop/STM32CubeL4-master/Drivers/BSP/Components/lis3mdl" -I"C:/Users/Arvyn/Desktop/STM32CubeL4-master/Drivers/BSP/Components/lps22hb" -I"C:/Users/Arvyn/Desktop/STM32CubeL4-master/Drivers/BSP/Components/lsm6dsl" -I../../../../Common/Inc -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../../../../../../../../Drivers/STM32L4xx_HAL_Driver/Inc -I../../../../../../../../Drivers/BSP/B-L475E-IOT01 -I../../../../../../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -Wno-strict-aliasing -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-SW4STM32

clean-SW4STM32:
	-$(RM) ./SW4STM32/startup_stm32l475xx.d ./SW4STM32/startup_stm32l475xx.o ./SW4STM32/syscalls.cyclo ./SW4STM32/syscalls.d ./SW4STM32/syscalls.o ./SW4STM32/syscalls.su

.PHONY: clean-SW4STM32

