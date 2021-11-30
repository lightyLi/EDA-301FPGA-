# EDA-301FPGA-
#### EDA基础编程练习，用黑金301板子来实现正弦波、方波、线性调频信号、2FSK、2ASK、2PSK的调幅和调相

***上面代码是verilog源代码，Course_design是顶层文件，src文件夹中是各模块代码，wave_data文件夹中是各种波形数据，pics文件夹中是工程的RTL图和8中原始波形图***

本代码并不是拿来就可以直接用的，而是需要懂一定的EDA基础才能创建工程添加文件，学弟学妹们加油。



本实验一共分为五个模块，由图可得，分别是：串口通信模块、原始波形显示模块、波形变化模块、数码管扫描显示模块和DAC转换模块。 
![RTL图](https://github.com/the-light011/EDA-301FPGA-/blob/main/pics/Screenshot%202021-11-28%20234338.png)

![波形图](https://github.com/the-light011/EDA-301FPGA-/blob/main/pics/%E5%8E%9F%E5%A7%8B%E6%B3%A2.jpg)
图中dout1~8为原始波形在Signal TapⅡ的输出显示，检测原始波形形状，也能与dout9输出的最终变化波形图样进行对比，更明显的看出波形变化。
 
从上到下分别是：正弦波、方波、三角波、锯齿波、线性调频信号、ASK、PSK和FSK信号的原始(未改变频率和幅度之前的)波形。
	总体思路是通过串口通信从电脑端传输一个2位16进制的数据，在接收的时候会转换成8位二进制数。分出前3位用来改变波形、中间3位用来改变频率、最后两位改变幅度。将数据传入changing_waves模块，完成改变波形、频率和幅度的操作。同时传入segment模块中，将输入的3中数据分别在数码管上进行显示。changing_waves模块最终会传出来一个最终波形数据，通过DAC模块传输到另一台电脑进行显示。
	其中正弦波、方波、锯齿波、三角波和线性调频信号是通过mif文件生成IP核来生成的，ASK、PSK、FAK分别是通过生成二进制序列来控制幅度、频率和相位。这8种信号都可以调节频率和幅度。
	
本来是ZZU大二暑假的课程设计，但是自己做的时候还不懂什么是调制信号，对EDA也不熟练，所以写的时候非常痛苦。现在开源出来，让学弟学妹们做的时候有些参考。
代码待改进的地方还有很多，比如板间DA AD数据传输还有问题，望能改进。
