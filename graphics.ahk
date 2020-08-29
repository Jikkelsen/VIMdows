#SingleInstance force

;~ #Include %A_ScriptDir%
;~ #Include Gdip.ahk
;~ #Include GDIpHelper.ahk

t::TestGdipToScreen()


TestGdipToScreen(){

    ;Gdip Srartup Block--------------------Start
    ;SetUpGDIP
    iWidth := -1
    iHeight := -1
    Width := iWidth
    Height := iHeight
    If (iWidth < 0) {
    	Width := A_ScreenWidth
    }
    if (iHeight < 0) {
    	height := A_ScreenHeight
    }
    
    
    ;JustTheBasics
    	; Start gdi+
    If !pToken := Gdip_Startup()
    {
    	MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
    	ExitApp
    }

    
    ; Create a layered window (+E0x80000 : must be used for UpdateLayeredWindow to work!) that is always on top (+AlwaysOnTop), has no taskbar entry or caption
    Gui, 1: -Caption +E0x80000 +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
    
    ; Show the window
    Gui, 1: Show, NA
    
    ; Get a handle to this window we have created in order to update it later
    hwnd1 := WinExist()
    
    ;StartDrawGDIP
    ; Create a gdi bitmap with width and height of what we are going to draw into it. This is the entire drawing area for everything
    hbm := CreateDIBSection(Width, Height)
    
    ; Get a device context compatible with the screen
    hdc := CreateCompatibleDC()
    
    ; Select the bitmap into the device context
    obm := SelectObject(hdc, hbm)
    
    ; Get a pointer to the graphics of the bitmap, for use with drawing functions
    G := Gdip_GraphicsFromHDC(hdc)	
    Gdip_GraphicsClear(G)
    ;Gdip Srartup Block--------------------End
     

CenterX := Round(A_ScreenWidth / 2)
CenterY := Round(A_ScreenHeight / 2)

TexToGraphicsText := "This is a test"
TexToGraphicsTextColor := "cff000000"
TexToGraphicsTextSize := "72"

;ex. "x460 y190 cff000000 r4 s72"
TexToGraphicsOpions := "x" . CenterX . A_Space . "y" . CenterY . A_Space . TexToGraphicsTextColor .  A_Space . "r4" . A_Space . "s" . TexToGraphicsTextSize



Gdip_SetSmoothingMode(G2, 4)

;ex. "x460 y190 cff000000 r4 s72"
Gdip_TextToGraphics(G, TexToGraphicsText , TexToGraphicsOpions)


    ;Gdip Close Block--------------------Start
    ;EndDrawGDIP() {
    ; Update the specified window we have created (hwnd1) with a handle to our bitmap (hdc), specifying the x,y,w,h we want it positioned on our screen
    ; So this will position our gui at (0,0) with the Width and Height specified earlier
    UpdateLayeredWindow(hwnd1, hdc, 0, 0, Width, Height)
    
    
    ; Select the object back into the hdc
    SelectObject(hdc, obm)
    
    ; Now the bitmap may be deleted
    DeleteObject(hbm)
    
    ; Also the device context related to the bitmap may be deleted
    DeleteDC(hdc)
    
    ; The graphics may now be deleted
    Gdip_DeleteGraphics(G)
    Gdip_Shutdown(pToken)
    ;Gdip Close Block--------------------End
Return
}

`::ExitApp
r::Reload