# CGM_SmallTool
封装的一些常用小工具

返回我的工单

缺少库

iOS 集成使用
Undefined symbols for architecture arm64: 
"_Encoder_Interface_Encode", referenced from: 
_RC_EncodePCMToAMR in RongIMLib(RCAMRDataConverter.o) 
"_Encoder_Interface_exit", referenced from: 
_RC_EncodePCMToAMR in RongIMLib(RCAMRDataConverter.o) 
"_Decoder_Interface_init", referenced from: 
-[RCAMRDataConverter decodeAMRToWAVE:] in RongIMLib(RCAMRDataConverter.o) 
"_Decoder_Interface_Decode", referenced from: 
-[RCAMRDataConverter decodeAMRToWAVE:] in RongIMLib(RCAMRDataConverter.o) 
"_Encoder_Interface_init", referenced from: 
_RC_EncodePCMToAMR in RongIMLib(RCAMRDataConverter.o) 
"_Decoder_Interface_exit", referenced from: 
-[RCAMRDataConverter decodeAMRToWAVE:] in RongIMLib(RCAMRDataConverter.o) 
ld: symbol(s) not found for architecture arm64 
clang: error: linker command failed with exit code 1 (use -v to see invocation)


RCAMRDataConverter类是对语音格式amr和wav间的转换，libopencore-amrnb是转码需要的库文件

