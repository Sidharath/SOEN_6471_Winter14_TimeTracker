//===============================================================================
// NarolaInfotech Common Support Library
// Core
//===============================================================================
// Copyright © NarolaInfotech.  All rights reserved.
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY
// OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT
// LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
// FITNESS FOR A PARTICULAR PURPOSE.
//===============================================================================

using System.ComponentModel;
using System.Management.Instrumentation;

using NarolaInfotech.Common.Instrumentation;

namespace NarolaInfotech.Common.Configuration.Manageability
{
	/// <summary>
	/// Installer for the WMI objects defined in the assembly.
	/// </summary>
	[RunInstaller(true)]
	public class Installer : CommonWmiInstaller
	{
	}
}
