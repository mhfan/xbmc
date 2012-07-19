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

#include "system.h"
#include "AndroidPlayer.h"
#include "FileItem.h"
#include "android/activity/XBMCApp.h"
#include "filesystem/MusicDatabaseFile.h"
#include "utils/log.h"
#include "URL.h"

using namespace XFILE;

CAndroidPlayer::CAndroidPlayer(IPlayerCallback& callback)
    : IPlayer(callback)
{
  m_bIsPlaying = false;
}

CAndroidPlayer::~CAndroidPlayer()
{
  CloseFile();
}

bool CAndroidPlayer::OpenFile(const CFileItem& file, const CPlayerOptions &options)
{
  try
  {
    m_bIsPlaying = true;
    m_launchFilename = file.GetPath();
    CLog::Log(LOGNOTICE, "%s: %s", __FUNCTION__, m_launchFilename.c_str());

    CStdString mainFile = m_launchFilename;
    CURL url(m_launchFilename);
    if (url.GetProtocol() == "musicdb")
      mainFile = CMusicDatabaseFile::TranslateUrl(url);

    if (mainFile[0] == '/') mainFile = "file://" + mainFile; else
    if (mainFile.substr(0, 4) == "http") {
	int i = mainFile.find_first_of('|');
	if (i != std::string::npos) mainFile.resize(i);	//mainFile[i] = '\0';
    }

    return CXBMCApp::Play(mainFile, file.IsVideo() || !file.IsAudio() ? "video" : "audio");
  }
  catch(...)
  {
    m_bIsPlaying = false;
    CLog::Log(LOGERROR, "%s - Exception thrown", __FUNCTION__);
    return false;
  }
}

bool CAndroidPlayer::CloseFile()
{
  m_bIsPlaying = false;
  return true;
}

bool CAndroidPlayer::HasVideo() const
{
  return true;
}

bool CAndroidPlayer::HasAudio() const
{
  return false;
}

