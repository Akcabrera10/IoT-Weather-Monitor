################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/Components/hts221.c \
../Drivers/BSP/Components/lis3mdl.c \
../Drivers/BSP/Components/lps22hb.c \
../Drivers/BSP/Components/lsm6dsl.c 

OBJS += \
./Drivers/BSP/Components/hts221.o \
./Drivers/BSP/Components/lis3mdl.o \
./Drivers/BSP/Components/lps22hb.o \
./Drivers/BSP/Components/lsm6dsl.o 

C_DEPS += \
./Drivers/BSP/Components/hts221.d \
./Drivers/BSP/Components/lis3mdl.d \
./Drivers/BSP/Components/lps22hb.d \
./Drivers/BSP/Components/lsm6dsl.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/%.o Drivers/BSP/Components/%.su Drivers/BSP/Components/%.cyclo: ../Drivers/BSP/Components/%.c Drivers/BSP/Components/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L475xx -DUSE_STM32L475_DISCOVERY -c -I../../../Inc -I"C:/Users/Arvyn/Desktop/STM32CubeL4-master/Drivers/BSP/Components/hts221" -I"C:/Users/Arvyn/Desktop/STM32CubeL4-master/Drivers/BSP/Components/lis3mdl" -I"C:/Users/Arvyn/Desktop/STM32CubeL4-master/Drivers/BSP/Components/lps22hb" -I"C:/Users/Arvyn/Desktop/STM32CubeL4-master/Drivers/BSP/Components/lsm6dsl" -I../../../../Common/Inc -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../../../../../../../../Drivers/STM32L4xx_HAL_Driver/Inc -I../../../../../../../../Drivers/BSP/B-L475E-IOT01 -I../../../../../../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -Wno-strict-aliasing -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-Components

clean-Drivers-2f-BSP-2f-Components:
	-$(RM) ./Drivers/BSP/Components/hts221.cyclo ./Drivers/BSP/Components/hts221.d ./Drivers/BSP/Components/hts221.o ./Drivers/BSP/Components/hts221.su ./Drivers/BSP/Components/lis3mdl.cyclo ./Drivers/BSP/Components/lis3mdl.d ./Drivers/BSP/Components/lis3mdl.o ./Drivers/BSP/Components/lis3mdl.su ./Drivers/BSP/Components/lps22hb.cyclo ./Drivers/BSP/Components/lps22hb.d ./Drivers/BSP/Components/lps22hb.o ./Drivers/BSP/Components/lps22hb.su ./Drivers/BSP/Components/lsm6dsl.cyclo ./Drivers/BSP/Components/lsm6dsl.d ./Drivers/BSP/Components/lsm6dsl.o ./Drivers/BSP/Components/lsm6dsl.su

.PHONY: clean-Drivers-2f-BSP-2f-Components

