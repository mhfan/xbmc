/*
 *      Copyright (C) 2005-2012 Team XBMC
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
 *  along with XBMC; see the file COPYING.  If not, see
 *  <http://www.gnu.org/licenses/>.
 *
 */

#include "system.h"
#include "GUIWindowQRCode.h"
#include "guilib/Key.h"

CGUIWindowQRCode::CGUIWindowQRCode(void)
    : CGUIWindow(WINDOW_QR_CODE_MENU, "QRCode.xml")
{
  m_loadType = LOAD_EVERY_TIME;
}

CGUIWindowQRCode::~CGUIWindowQRCode(void)
{
}
