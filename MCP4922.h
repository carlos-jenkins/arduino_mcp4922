/*
  MCP4922.h - Library for Microchip 12bit DACs
  Created by Carlos Jenkins <http://carlos.jenkins.co.cr>, April 2, 2011.
  Released into the public domain.
*/
#ifndef MCP4922_H
#define MCP4922_H

#include "WProgram.h"
#include "../SPI/SPI.h" // Seriously, there is not a better way?

class MCP4922
{
  public:
    MCP4922(byte dac_cs, byte dac_latch);
    void setBuffer(boolean is_buffered);
    void setGain(boolean has_gain);
    void sendToA(word data);
    void sendToB(word data);
    void updateOutputs();
  private:
    word _config;
    byte _dac_cs;
    byte _dac_latch;
    void sendData(word data);
    
};

#endif
