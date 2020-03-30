using VideoIO
using ImageInTerminal

ImageInTerminal.use_24bit()
f=opencamera()
img=read(f)

