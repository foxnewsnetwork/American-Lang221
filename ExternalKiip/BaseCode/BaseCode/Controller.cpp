/*
MainControl.cpp
Written by Matthew Fisher

MainControl includes everything that changes often between applications, such as what meshes to load,
and also determines what is rendered each frame.
*/

#include "Main.h"

enum MenuEntryType
{
    MenuEntryFile,
    MenuEntryFileQuit,
};

void Controller::FreeMemory()
{
    ReleaseAssets();
}

void Controller::InitMenu()
{
    _menu.Init(_state->window);
    
    Menu &FileMenu = _menu.MenuBar().AddSubMenu(_state->window, MenuEntryFile, "File");
    FileMenu.AddString(_state->window, MenuEntryFileQuit, "Quit\tCtrl+Q");
}

void Controller::ProcessEvents()
{
    _menu.DispatchKeyboardShortcuts(_state->input);

    while(_state->input.EventPresent())
    {
        InputEvent CurEvent = _state->input.PopEvent();
        if(CurEvent.Type == InputEventMenu)
        {
            switch(CurEvent.Id)
            {
            case MenuEntryFileQuit:
                PostQuitMessage(0);
                break;
            }
        }
    }
}

void Controller::ResetCamera()
{
    _camera.Reset(Vec3f(4.0f, 3.0f, 2.0f), Vec3f::eZ, Vec3f::Origin);
}

void Controller::ReleaseAssets()
{
    for(UINT assetIndex = 0; assetIndex < _assetList.Length(); assetIndex++)
    {
        _assetList[assetIndex]->ReleaseMemory();
    }
}

void Controller::ResetAssets()
{
    for(UINT assetIndex = 0; assetIndex < _assetList.Length(); assetIndex++)
    {
        _assetList[assetIndex]->Reset(*_state->graphics);
    }

    ReloadTextures();
}

void Controller::ReSize()
{
    _projection = Matrix4::PerspectiveFov(
                60.0f * Math::PIf / 180.0f,
                _state->window.AspectRatio(),
                0.01f,
                200.0f);
}

void Controller::Init(AppState &state)
{
    _state = &state;
    AllocConsole();

    InitMenu();
}

void Controller::Init3D()
{
    InitAssets();

    _primitives.Init(_state->graphics->CastD3D9(), _assets.vsBase, _assets.psBase, 0, 1, 6);

    ResetCamera();
}

void Controller::InitAssets()
{
    _assets.sphere.SetGD(*_state->graphics);
    _assets.sphere.CreateSphere(1.0f, 3);
    _assets.sphere.SimplifyToFaces(200);
    _assets.sphere.GCNormals();

    _assets.font.Init(*_state->graphics, "Verdana", 20, FW_BOLD);
    _assets.psBase.Init(*_state->graphics, "Assets\\TextureColor.ps");
    _assets.vsBase.Init(*_state->graphics, "Assets\\TextureColor.vs");
    _assets.white.Init(*_state->graphics);
    
    _assetList.PushEnd(&_assets.font);
    _assetList.PushEnd(&_assets.psBase);
    _assetList.PushEnd(&_assets.vsBase);
    _assetList.PushEnd(&_assets.white);

    ReloadTextures();
}

void Controller::ReloadTextures()
{
    Bitmap white(2, 2);
    white.Clear(RGBColor::White);
    _assets.white.Load(white);
}

void Controller::UpdateCamera()
{
    _camera.KeyboardWASD  (_state->input, _state->timer.SPF() * 5.0f);
    _camera.KeyboardNumpad(_state->input, _state->timer.SPF());
    _camera.Update();
}

void Controller::ProcessKeyboardInput()
{
    if(_state->input.KeyCheckOnce(KEY_F))
    {
        _state->graphics->ToggleWireframe();
    }
}

void Controller::Status(const String &s, RGBColor c)
{
    _assets.font.DrawString(s, Vec2i(2, _consoleY), c);
    _consoleY += 20;
}

void Controller::StatusText()
{
    _consoleY = 2;
    Status(String("FPS: ") + String(_state->timer.FPS()), RGBColor::Red);
}

void Controller::Render()
{
    _assets.vsBase.Set();
    _assets.psBase.Set();
    _assets.white.Set(0);

    Matrix4 viewProj = _camera.Matrix() * _projection;
    _assets.psBase.SetVec4("Color", Vec4f(1.0f, 1.0f, 1.0f, 1.0f));
    _assets.vsBase.SetMatrix("WorldViewProj", viewProj);
    _assets.vsBase.SetMatrix("World", Matrix4::Identity());

    _assets.sphere.Render();

    _primitives.RenderSphere(viewProj, 0.1f, Vec3f::eX, RGBColor::Red);
}

void Controller::Frame()
{
    ProcessKeyboardInput();
    ProcessEvents();

    UpdateCamera();

    Render();

    StatusText();
}
