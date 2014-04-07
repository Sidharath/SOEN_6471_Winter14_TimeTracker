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
using System.Collections.Generic;
using System.Configuration;

namespace NarolaInfotech.Common.Configuration.Manageability
{
	internal interface IConfigurationAccessor
	{
		ConfigurationSection GetSection(String sectionName);
		void RemoveSection(String sectionName);
		IEnumerable<String> GetRequestedSectionNames();
	}
}
