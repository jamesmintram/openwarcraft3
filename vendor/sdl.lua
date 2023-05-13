project "sdl"
	filter "system:windows"
		kind          "SharedLib" 
		staticruntime "off"

	filter "system:macosx"
		kind          "StaticLib"
		staticruntime "on"

	filter "system:linux"
		kind          "StaticLib"
		staticruntime "on"
	filter {}

    defines {
        "SDL_VIDEO_RENDER_OGL=1",
        "SDL_VIDEO_OPENGL_CGL=1",

        "SDL_VIDEO_METAL=0",
        "SDL_VIDEO_VULKAN=0",
        
        "SDL_VIDEO_RENDER_OGL_ES2=0",
        "SDL_VIDEO_RENDER_METAL=0",
        "SDL_VIDEO_RENDER_SW=0",
        
        "SDL_VIDEO_OPENGL_EGL=0"
    }

    language "C"

	includedirs      {"sdl/include"}

	filter "system:windows"
		links {
			         "setupapi",
			         "winmm",
			         "imm32",
			         "version",
		}
	filter {}

	files {
		-- All platforms.

        -- Header files.
		"include/*.h",									    
		"sdl/src/audio/*.h",								    
		"sdl/src/audio/disk/*.h",                               
		"sdl/src/audio/dummy/*.h",						        
		"sdl/src/dynapi/*.h",								    
		"sdl/src/events/blank_cursor.h",					    
		"sdl/src/events/default_cursor.h",				        
		"sdl/src/events/SDL_clipboardevents_c.h",			    
		"sdl/src/events/SDL_displayevents_c.h",			        
		"sdl/src/events/SDL_dropevents_c.h",				    
		"sdl/src/events/SDL_events_c.h",					    
		"sdl/src/events/SDL_gesture_c.h",					    
		"sdl/src/events/SDL_keyboard_c.h",				        
		"sdl/src/events/SDL_mouse_c.h",					        
		"sdl/src/events/SDL_sysevents.h",					    
		"sdl/src/events/SDL_touch_c.h",					       
		"sdl/src/events/SDL_windowevents_c.h",			        
		"sdl/src/haptic/SDL_syshaptic.h",					    
		"sdl/src/joystick/hidapi/*.h",					        
		"sdl/src/joystick/SDL_hidapijoystick_c.h",		        
		"sdl/src/joystick/SDL_joystick_c.h",				    
		"sdl/src/joystick/SDL_sysjoystick.h",				    
		"sdl/src/libm/*.h",								        
						    
		"sdl/src/render/SDL_sysrender.h",					    
		"sdl/src/render/SDL_yuv_sw_c.h",					    
		"sdl/src/render/software/*.h",					        
		"sdl/src/SDL_dataqueue.h",						        
		"sdl/src/SDL_error_c.h",							    
		"sdl/src/sensor/*.h",								    
		"sdl/src/sensor/dummy/*.h",						        
		"sdl/src/thread/*.h",								    
		"sdl/src/timer/*.h",
		"sdl/src/video/*.h",
		"sdl/src/video/dummy/*.h",
        
        -- C files.
        "sdl/src/*.c",
        "sdl/src/atomic/*.c",
        
        "sdl/src/audio/*.c",
        "sdl/src/audio/disk/*.c",
        "sdl/src/audio/dummy/*.c",
        
        "sdl/src/cpuinfo/*.c",
        "sdl/src/dynapi/*.c",
        "sdl/src/events/*.c",
        "sdl/src/file/*.c",
        "sdl/src/haptic/*.c",
        "sdl/src/joystick/*.c",
        "sdl/src/joystick/hidapi/*.c",
        "sdl/src/libm/*.c",
        "sdl/src/power/*.c",
        
        "sdl/src/render/SDL_render.c",
        "sdl/src/render/SDL_yuv_sw.c",
        
        "sdl/src/sensor/dummy/SDL_dummysensor.c",
        "sdl/src/sensor/SDL_sensor.c",
        
        "sdl/src/stdlib/*.c",
        
        "sdl/src/thread/*.c",
        "sdl/src/thread/generic/SDL_syscond.c",
        
        "sdl/src/timer/*.c",
        "sdl/src/timer/windows/SDL_systimer.c",

        -- "sdl/src/video/*.c",
        "sdl/src/video/SDL_blit*.c",
        "sdl/src/video/SDL_pixels.c",
        "sdl/src/video/SDL_shape.c",
        "sdl/src/video/SDL_surface.c",
        "sdl/src/video/SDL_video.c",
        "sdl/src/video/SDL_yuv.c",
        "sdl/src/video/dummy/*.c",
        "sdl/src/video/yuv2rgb/*.c",
	}

    filter "system:macosx"
        buildoptions { "-fobjc-arc" }
        files {
            "sdl/src/video/cocoa/*.h",						    
            "sdl/src/video/cocoa/SDL_cocoaclipboard.m",
            "sdl/src/video/cocoa/SDL_cocoaevents.m",
            "sdl/src/video/cocoa/SDL_cocoakeyboard.m",
            "sdl/src/video/cocoa/SDL_cocoamessagebox.m",
            "sdl/src/video/cocoa/SDL_cocoamodes.m",
            "sdl/src/video/cocoa/SDL_cocoamouse.m",
            "sdl/src/video/cocoa/SDL_cocoaopengl.m",
            "sdl/src/video/cocoa/SDL_cocoashape.m",
            "sdl/src/video/cocoa/SDL_cocoavideo.m",
            "sdl/src/video/cocoa/SDL_cocoawindow.m",

            "sdl/src/render/opengl/*.h",						    
            "sdl/src/render/opengl/*.c",

            "sdl/src/thread/pthread/*.c",
        }
		
	inlining          "Explicit" 
	intrinsics        "Off"

	filter "system:windows"
		systemversion "latest"
		defines {
			          "_WINDOWS"
		}

	filter "configurations:Debug"
		defines {
			          "_DEBUG"
		}
		runtime       "Debug"
		symbols       "On"

	filter "configurations:Release"
		defines {
			          "NDEBUG"
		}
		runtime       "Release"
		optimize      "Speed"