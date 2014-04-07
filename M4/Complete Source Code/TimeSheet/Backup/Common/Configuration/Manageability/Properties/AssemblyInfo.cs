//===============================================================================
// NarolaInfotech Common Support Library
// Core
//===============================================================================
// Copyright  Microsoft Corporation.  All rights reserved.
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY
// OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT
// LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
// FITNESS FOR A PARTICULAR PURPOSE.
//===============================================================================

using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Security;
using System.Security.Permissions;
using System.Management.Instrumentation;
using NarolaInfotech.Common.Configuration.Manageability;
using NarolaInfotech.Common.Instrumentation.Configuration;

[assembly: InternalsVisibleTo("EnterpriseLibrary.Common.Configuration.Manageability.Tests")]
[assembly: InternalsVisibleTo("NarolaInfotech.Common.Configuration.Manageability.Design")]
[assembly: ConfigurationSectionManageabilityProvider(InstrumentationConfigurationSection.SectionName, typeof(InstrumentationConfigurationSectionManageabilityProvider))]