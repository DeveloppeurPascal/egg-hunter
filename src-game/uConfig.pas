unit uConfig;

interface

uses uMusicLoop;

type
  TConfig = class
  private
    class procedure SetBruitagesOnOff(const Value: boolean); static;
    class procedure SetInterfaceTactileOnOff(const Value: boolean); static;
    class procedure SetMusiqueDAmbianceOnOff(const Value: boolean); static;
    class function getBruitagesOnOff: boolean; static;
    class function getInterfaceTactileOnOff: boolean; static;
    class function getMusiqueDAmbianceOnOff: boolean; static;
    class procedure SetBruitagesVolume(const Value: TVolumeSonore); static;
    class procedure SetMusiqueDAmbianceVolume(const Value
      : TVolumeSonore); static;
    class function getBruitagesVolume: TVolumeSonore; static;
    class function getMusiqueDAmbianceVolume: TVolumeSonore; static;
  public
    class property InterfaceTactileOnOff: boolean read getInterfaceTactileOnOff
      write SetInterfaceTactileOnOff;
    class property BruitagesOnOff: boolean read getBruitagesOnOff
      write SetBruitagesOnOff;
    class property BruitagesVolume: TVolumeSonore read getBruitagesVolume
      write SetBruitagesVolume;
    class property MusiqueDAmbianceOnOff: boolean read getMusiqueDAmbianceOnOff
      write SetMusiqueDAmbianceOnOff;
    class property MusiqueDAmbianceVolume: TVolumeSonore
      read getMusiqueDAmbianceVolume write SetMusiqueDAmbianceVolume;
  end;

implementation

uses
  system.sysutils, system.IOUtils, uParam;

const
  CBruitagesOnOff = 'BruitagesOnOff';
  CBruitagesVolume = 'BruitagesVolume';
  CMusiqueAmbianceOnOff = 'MusiqueAmbianceOnOff';
  CMusiqueAmbianceVolume = 'MusiqueAmbianceVolume';
  CInterfaceTactileOnOff = 'InterfaceTactileOnOff';
  CEffetsVisuelsOnOff = 'EffetsVisuelsOnOff';
  CCheminPartageCapturesEcran = 'CheminPartageCapturesEcran';

  { TConfig }

class function TConfig.getBruitagesOnOff: boolean;
begin
  result := tParams.getValue(CBruitagesOnOff, true);
end;

class function TConfig.getBruitagesVolume: TVolumeSonore;
begin
  result := tParams.getValue(CBruitagesVolume, 100);
end;

class function TConfig.getInterfaceTactileOnOff: boolean;
var
  ValeurParDefaut: boolean;
begin
  // TODO : g�rer les valeurs par rapport aux infos des services de plateforme
{$IF Defined(iOS) or Defined(ANDROID)}
  ValeurParDefaut := true;
{$ELSE}
  ValeurParDefaut := false;
{$ENDIF}
  result := tParams.getValue(CInterfaceTactileOnOff, ValeurParDefaut);
end;

class function TConfig.getMusiqueDAmbianceOnOff: boolean;
begin
  result := tParams.getValue(CMusiqueAmbianceOnOff, true);
end;

class function TConfig.getMusiqueDAmbianceVolume: TVolumeSonore;
begin
  result := tParams.getValue(CMusiqueAmbianceVolume, 100);
end;

class procedure TConfig.SetBruitagesOnOff(const Value: boolean);
begin
  tParams.setValue(CBruitagesOnOff, Value);
end;

class procedure TConfig.SetBruitagesVolume(const Value: TVolumeSonore);
begin
  tParams.setValue(CBruitagesVolume, Value);
end;

class procedure TConfig.SetInterfaceTactileOnOff(const Value: boolean);
begin
  tParams.setValue(CInterfaceTactileOnOff, Value);
end;

class procedure TConfig.SetMusiqueDAmbianceOnOff(const Value: boolean);
begin
  tParams.setValue(CMusiqueAmbianceOnOff, Value);
end;

class procedure TConfig.SetMusiqueDAmbianceVolume(const Value: TVolumeSonore);
begin
  tParams.setValue(CMusiqueAmbianceVolume, Value);
end;

end.