#include "MCP4922.h"

MCP4922::MCP4922(byte dac_cs, byte dac_latch)
{
    // Init the configuration word
    // Default:
    //  0 - Write to DacA
    //  1 - Buffered
    //  1 - Gain x1
    //  1 - Enable the output
    //  0..0 - Set to 0 to use the bitwise or
    this->_config = 0b0111000000000000;

    // Save which pins are connected
    this->_dac_cs = dac_cs;
    this->_dac_latch = dac_latch;

    // Init the pins
    pinMode(_dac_cs, OUTPUT);
    pinMode(_dac_latch, OUTPUT);
    digitalWrite(_dac_cs, HIGH);
    digitalWrite(_dac_latch, HIGH);

    // Init SPI communication
    SPI.begin();
    SPI.setBitOrder(MSBFIRST);           // Posible problem with other devices sharring the SPI bus?
    SPI.setDataMode(SPI_MODE0);          // MCP4922 supports both 0-0 and 1-1 modes
    SPI.setClockDivider(SPI_CLOCK_DIV2); // Boost to 8MHz, MCP4922 supports up to 20MHz
}

void MCP4922::setBuffer(boolean is_buffered)
{
    if(is_buffered) {
        bitSet(_config, 14);
    } else {
        bitClear(_config, 14);
    }
    return;
}

void MCP4922::setGain(boolean has_gain)
{
    if(has_gain) {
        bitClear(_config, 13);
    } else {
        bitSet(_config, 13);
    }
    return;
}

void MCP4922::sendToA(word data)
{
    // Set output to DAC_A
    bitClear(_config, 15);

    // Send data
    this->sendData(data);

    return;
}

void MCP4922::sendToB(word data)
{
    // Set output to DAC_B
    bitSet(_config, 15);

    // Send data
    this->sendData(data);

    return;
}

void MCP4922::updateOutputs()
{
    digitalWrite(_dac_latch, LOW);
    digitalWrite(_dac_latch, HIGH);
}

void MCP4922::sendData(word data)
{
    // MCP4922 is a 12bit DAC
    // 4 leftmost bits are configuration bits
    // 12 rightmost bits are data bits

    // Protect against configuration bits pollution
    if(data > 4095) {     // 12 bits full
        data = 4095;
    } else if(data < 0) { // I think words can't be negative, but just in case
        data = 0;
    }

    // Merge the config and data bits
    data = data | _config;

    // Select the chip
    digitalWrite(_dac_cs, LOW);

    // Send data
    SPI.transfer(highByte(data));
    SPI.transfer(lowByte(data));

    // Deselect the chip so input can be latched to internal registers
    digitalWrite(_dac_cs, HIGH);
    
    return;
}
