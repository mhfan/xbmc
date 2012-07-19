#pragma once
/*
 *      Copyright (C) 2012 Team XBMC
 *      http://www.xbmc.org
 *
 *  This Program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2, or (at your option)
 *  any later version.
 *
 *  This Program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with XBMC; see the file COPYING.  If not, write to
 *  the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.
 *  http://www.gnu.org/copyleft/gpl.html
 *
 */

#include "cores/IPlayer.h"

class CGUIDialogOK;

class CAndroidPlayer : public IPlayer
{
public:
  CAndroidPlayer(IPlayerCallback& callback);
  virtual ~CAndroidPlayer();
  virtual void RegisterAudioCallback(IAudioCallback* pCallback) { }
  virtual void UnRegisterAudioCallback() { }
  virtual bool OpenFile(const CFileItem& file, const CPlayerOptions &options);
  virtual bool CloseFile();
  virtual bool IsPlaying() const { return m_bIsPlaying; }
  virtual void Pause() { }
  virtual bool IsPaused() const { return false; }
  virtual bool HasVideo() const;
  virtual bool HasAudio() const;
  virtual void ToggleOSD() { }
  virtual void SwitchToNextLanguage() { }
  virtual void ToggleSubtitles() { }
  virtual bool CanSeek() { return false; }
  virtual void Seek(bool bPlus, bool bLargeStep) { }
  virtual void SeekPercentage(float iPercent) { }
  virtual void SeekTime(int64_t iTime) { }
  virtual float GetPercentage() { return 0.0f; }
  virtual void SetVolume(float volume) { }
  virtual void SetDynamicRangeCompression(long drc) { }
  virtual void SetContrast(bool bPlus) { }
  virtual void SetBrightness(bool bPlus) { }
  virtual void SetHue(bool bPlus) { }
  virtual void SetSaturation(bool bPlus) { }
  virtual void GetAudioInfo(CStdString& strAudioInfo) { strAudioInfo = "CAndroidPlayer:GetAudioInfo"; }
  virtual void GetVideoInfo(CStdString& strVideoInfo) { strVideoInfo = "CAndroidPlayer:GetVideoInfo"; }
  virtual void GetGeneralInfo(CStdString& strGeneralInfo) { strGeneralInfo = "CAndroidPlayer:GetGeneralInfo"; }
  virtual void Update(bool bPauseDrawing) { }
  virtual void SwitchToNextAudioLanguage() { }
  virtual bool CanRecord() { return false; }
  virtual bool IsRecording() { return false; }
  virtual bool Record(bool bOnOff) { return false; }
  virtual void SetAVDelay(float fValue = 0.0f) { }
  virtual float GetAVDelay() { return 0.0f; }

  virtual void SetSubTitleDelay(float fValue = 0.0f) { }
  virtual float GetSubTitleDelay() { return 0.0f; }

  virtual int64_t GetTime() { return 0; }
  virtual int64_t GetTotalTime() { return 0; }
  virtual void ToFFRW(int iSpeed) { }
  virtual void ShowOSD(bool bOnoff) { }
  virtual void DoAudioWork() { }

  virtual CStdString GetPlayerState() { return ""; }
  virtual bool SetPlayerState(CStdString state) { return true; }

private:
  bool m_bIsPlaying;
  CStdString m_launchFilename;
};
