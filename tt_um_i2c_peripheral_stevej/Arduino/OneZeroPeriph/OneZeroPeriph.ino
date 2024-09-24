/**
 * Test code for stevej's tinytapeout 08 i2c.
 * I2C Master for requesting a zero-one byte from a custom
 * I2C peripheral at 0x2A.
 *
 */

#include <Wire.h>

byte i2c_rcv;             // data received from I2C bus
unsigned long time_start; // start time in milliseconds
int stat_LED;             // status of LED: 1 = ON, 0 = OFF

int ran = 0;

void setup()
{
    Wire.begin(); // join I2C bus as the master
    while (!Serial);
    i2c_rcv = 255;
    time_start = millis();
    stat_LED = 0;

    pinMode(13, OUTPUT);
    Serial.println("\ni2c transmitter enabled");
}

void loop()
{
  if (ran == 0) {
    Serial.println("i2c transmitter requesting from peripheral");
    //Wire.beginTransmission(0x2A);

    Wire.requestFrom(0x2A, 1);
    if (Wire.available())
    {
        i2c_rcv = Wire.read();
    } else {
      Serial.println("Wire was never available");
    }
    Serial.println(i2c_rcv, BIN);
    ran = 1;
    Serial.println("ending transmission");
   // Wire.endTransmission();
  }

    // blink an LED to show that we're alive.
    if ((millis() - time_start) > (1000 * (float)(i2c_rcv / 255)))
    {
        stat_LED = !stat_LED;
        time_start = millis();
    }
    digitalWrite(13, stat_LED);
}