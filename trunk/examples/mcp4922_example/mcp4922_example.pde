/* Copyright (c) 2011 Carlos Jenkins <http://carlos.jenkins.co.cr/>
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

/////////////////////////////
// INCLUDES
/////////////////////////////

#include <SPI.h>
#include <MCP4922.h>


/////////////////////////////
// DEFINITIONS
/////////////////////////////

//####### HARDWARE #######
// Digital to analog converter
//   CS : Select the DAC Chip for SPI communication
//   LATCH : Update both analog outputs of the chip
#define DAC_CS 9
#define DAC_LATCH 8


/////////////////////////////
// VARIABLES
/////////////////////////////

// Create the MCP4922 DAC object
MCP4922 dac(DAC_CS, DAC_LATCH);

// How much do you want to jump
int jump = 250;

// How much do you want to wait between jumps
int wait = 2000;


/////////////////////////////
// MAIN FUNCTIONS
/////////////////////////////

// Arduino main setup function
void setup()
{
}

// Arduino main loop function
void loop()
{
  for(int i = 0; i < 4096; i = i + jump) {
    dac.sendToA(i);
    dac.sendToB(4095 - i);
    dac.updateOutputs();
    delay(wait);
  }
}
