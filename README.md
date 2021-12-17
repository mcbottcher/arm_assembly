# ARM ASSEMBLY PROJECT

Some inline arm assembly to flash some LEDs on the FRDM-KL25Z

## Details

The FRFM-KL25Z uses the Coretex-M0+ which based on the ARM v6m architecture. [FRDM-KL25Z](https://os.mbed.com/platforms/KL25Z/)

On the development board, there is a set of RGB LEDs available for use.

The idea behind the code is to have a simple counter which increments by one on each loop. If the counter reaches some target value set by the user, the LED will be toggled and the counter reset. This makes the LED flash. Adjusting the target value changes the frequency at which the LED flashes.

In order to toggle the LEDs, you have to write to the PTOR register of the GPIO Port responsible for the LED. For this hardware target, the corresponding values can be found [here](https://github.com/ARMmbed/mbed-os/blob/master/targets/TARGET_Freescale/TARGET_KLXX/TARGET_KL25Z/device/MKL25Z4.h#L996).

## Usage

To run this yourself with the FRDM-KL25Z, you can go to the mbed.org online compiler, and create a new project. Paste the main.cpp code into main.cpp and create a new file in the same folder called my_asm.s and copy the assembly in. Then compile and run.

Here is a quick video of what it might look like:

https://user-images.githubusercontent.com/59874862/146616039-81301e5d-044c-46de-a4b7-7d1731d5b8ac.mp4

