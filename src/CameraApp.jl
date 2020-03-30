module CameraApp

using VideoIO
using ImageInTerminal

export demo

function demo()
    ImageInTerminal.use_24bit()
    f = opencamera()
    outH, outW = displaysize(stdout)
    try
        print("\x1b[?25l") # hide cursor
        while true
            buf = IOBuffer()
            img = read(f)
            outH, outW = displaysize(stdout)
            print(buf, "\x1b[999D\x1b[$(outH)A")
            ImageInTerminal.imshow(buf, img, (outH, outW))
            println(buf |> take! |> String)
            sleep(0.01)
        end
    catch e
        close(f)
        print("\x1b[?25h") # unhide cursor
    finally
        println("exit")
    end
end

function real_main()
    # Write julia logic what you want
    demo()
end

function julia_main()
    try
        real_main()
    catch
        Base.invokelatest(Base.display_error, Base.catch_stack())
        return 1
    end
    return 0
end


end # module
