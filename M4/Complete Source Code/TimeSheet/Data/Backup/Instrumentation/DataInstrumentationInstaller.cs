//===============================================================================
// NarolaInfotech Support Data Library
// Data Access Application Block
//===============================================================================
// Copyright � NarolaInfotech.  All rights reserved.
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY
// OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT
// LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
// FITNESS FOR A PARTICULAR PURPOSE.
//===============================================================================

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration.Install;
using System.Management.Instrumentation;
using NarolaInfotech.Common.Instrumentation;
using System.Collections;

namespace NarolaInfotech.Data.Instrumentation
{
	/// <summary>
	/// Represents the installer for the instrumentation events. Not intended for direct use.
	/// </summary>
	[RunInstaller(true)]
    public partial class DataInstrumentationInstaller : DefaultManagementProjectInstaller
    {
		/// <summary>
		/// Initializes a new instance of the <see cref="DataInstrumentationInstaller"/> class.
		/// Lets the system know that the InstallUtil.exe tool will be run against this assembly
		/// </summary>
		public DataInstrumentationInstaller()
        {
            Installers.Add(new ReflectionInstaller<PerformanceCounterInstallerBuilder>());
            Installers.Add(new ReflectionInstaller<EventLogInstallerBuilder>());
        }
    }
}