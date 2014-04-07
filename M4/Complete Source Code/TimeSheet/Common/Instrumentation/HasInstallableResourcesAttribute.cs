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

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;

namespace NarolaInfotech.Common.Instrumentation
{            
	/// <summary>
	/// Defines those classes and structs that have some sort of resources that need to be installed.
	/// </summary>
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Struct, AllowMultiple = false)]
    public sealed class HasInstallableResourcesAttribute : Attribute
    {
    }
}
