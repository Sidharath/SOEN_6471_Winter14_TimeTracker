//===============================================================================
// NarolaInfotech Common Support Library
// Core
//===============================================================================
// Copyright � NarolaInfotech.  All rights reserved.
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY
// OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT
// LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
// FITNESS FOR A PARTICULAR PURPOSE.
//===============================================================================

using System;
using Microsoft.Win32;

namespace NarolaInfotech.Common.Configuration.Manageability
{
	internal class RegistryAccessor : IRegistryAccessor
	{
		public IRegistryKey CurrentUser
		{
			get { return new RegistryKeyWrapper(Registry.CurrentUser); }
		}

		public IRegistryKey LocalMachine
		{
			get { return new RegistryKeyWrapper(Registry.LocalMachine); }
		}
	}
}
