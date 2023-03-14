#include "BH1750.h"
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <linux/i2c-dev.h>
#include <errno.h>
#include <iostream>
#include "pigpio.h"

using namespace std;

#ifndef NDEBUG
#define DEBUG
#endif

BH1750::BH1750(BH1750DeviceSettings bh1750deviceSettings) 
{
	device = bh1750deviceSettings;
#ifdef DEBUG
	fprintf(stderr,"I2c: bus=%02x, BH1750Addr=%02x\n",
		device.i2c_bus,device.BHAddress);
#endif
     BH1750::BH1750initgpio();
}



void BH1750::run(BH1750 *BH1750)     //这边有个bug 好像每次今来都要上电 增加耗时？
{
// 发送地址寻址
  std::cout<<"create thread success"<<endl;
  BH1750->BH1750dataready(BH1750);
}

void BH1750::start()
{
    if (USThread)
    {
        std::cout << "thread already running";
        //throw "ERROR: Thread already running.";
    }
	else
    {
        USThread = new std::thread(BH1750::run, this);//run作线程入口，this作传入参数
        std::cout<<" success"<<endl;
	} 
}

void BH1750::BH1750initgpio()
{
	if (gpioInitialise() < 0)
{
   std::cout << "pigpio initialisation failed.";
}
else
{
   gpioSetMode(device.bh1750_i2c_slkgpio, PI_OUTPUT);  // SLK initial
   gpioSetMode(device.bh1750_i2c_sdagpio, PI_OUTPUT); //  SDA initial
   std::cout<<"gpio initial success"<<endl;
}	
}

void BH1750::stop()
{
    int i = 0;
    while (i<=30)
    {   
        sleep(1);
        i++;
        /* code */
    }
    
    
    if (USThread)
    {
        USThread->join();
        delete USThread;
        USThread = NULL;
    }
}

void BH1750::BH1750WritePoweron()
{
    I2CwriteByte(BH1750_ADDR,BH1750_Register_ADDR,poweron); // subaddress 是寄存器地址，但BH1750寄存器地址可以省略，此外是否需要延时
    std::cout<<"poweron success"<<endl;
}

void BH1750::BH1750WriteWorkMode(uint8_t workmode)
{
	I2CwriteByte(BH1750_ADDR,BH1750_Register_ADDR,workmode);
    std::cout<<"write workmode success"<<endl;
}

void BH1750::BH1750RecData()
{
     uint16_t ret = I2CreadBytes(BH1750_ADDR, BH1750_Register_ADDR);  //count 是2吗？2指寄存器数量，BH1750只有一个
     BH1750_buf[0] = ret&0x0f;  //数据处理， 但还不确定第一字节是高位还是第二字节是高位
     BH1750_buf[1] = ret&0xf0;
     std::cout<<"rec data  success"<<endl;
}

float BH1750::lightcal(uint32_t*buf)
{
	float flight;
    switch (currentworkmode)
    {
    case continue_r1:
        flight=(buf[0]*256+buf[1])*1.0/1.2;
        std::cout << "currentR=r1"<<endl;
        printf("%.2f",flight);
        break;
    case continue_r2:
        flight=(buf[0]*256+buf[1])*0.5/1.2;
        std::cout << "currentR=r2"<<endl;
        printf("%.2f",flight);
        break;
    case continue_r3:
        flight=(buf[0]*256+buf[1])*4.0/1.2;
        std::cout << "currentR=r3"<<endl;
        printf("%.2f",flight);
        break;
    default:
	std::cout << "donnot get correct light intensity.";
        break;
    }
	return flight;
}

void BH1750::BH1750dataready(BH1750 *BH1750)
{
   
 BH1750->BH1750WritePoweron();     // power on   //先写入一个死值，不确定寄存器地址address
  BH1750->BH1750WriteWorkMode(currentworkmode);  //set workmode  //理论上应该用户选择
   if (!BH1750Callback) return;
   std::cout<<"start rec data"<<endl;
  BH1750->BH1750RecData();       // get the data two bytes
  real_lightvalue=lightcal(BH1750_buf);  // get real light inensity
    BH1750Callback->hasSample(real_lightvalue);
}
 
// i2c read and write protocols
void BH1750::I2CwriteByte(uint8_t address, uint8_t subAddress, uint8_t data)
{
	int fd = i2cOpen(device.i2c_bus, address, 0);
	if (fd < 0) {
#ifdef DEBUG
		fprintf(stderr,"Could not write %02x to %02x,%02x,%02x\n",data,device.i2c_bus,address,subAddress);
#endif
		throw could_not_open_i2c;
	}
	i2cWriteByteData(fd, subAddress, data);
	i2cClose(fd);
}

uint8_t BH1750::I2CreadByte(uint8_t address, uint8_t subAddress)
{
	int fd = i2cOpen(device.i2c_bus, address, 0);
	if (fd < 0) {
#ifdef DEBUG
		fprintf(stderr,"Could not read byte from %02x,%02x,%02x\n",device.i2c_bus,address,subAddress);
#endif
		throw could_not_open_i2c;
	}
	int data; // `data` will store the register data
	data = i2cReadByteData(fd, subAddress);
	if (data < 0) {
#ifdef DEBUG
		fprintf(stderr,"Could not read byte from %02x,%02x,%02x. ret=%d.\n",device.i2c_bus,address,subAddress,data);
#endif
		throw "Could not read from i2c.";
	}
	i2cClose(fd);
	return data;           
}

uint16_t BH1750::I2CreadBytes(uint8_t address, uint8_t subAddress)
{
	int fd = i2cOpen(device.i2c_bus, address, 0);
	if (fd < 0) {
#ifdef DEBUG
		fprintf(stderr,"Could not read");
#endif
		throw could_not_open_i2c;
	}
	uint16_t temp = i2cReadWordData(fd,subAddress);
	i2cClose(fd);
     std::cout<<"读到的值是="<<temp<<endl;
	return temp;

}

