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

namespace NarolaInfotech.Common.Instrumentation
{
    /// <summary>
	/// Provides the friendly name of the app domain as the prefix in formatting a 
	/// particular instance of a performance counter.
	/// </summary>
    public class AppDomainNameFormatter : IPerformanceCounterNameFormatter
    {
        /// <summary>
		/// Creates the formatted instance name for a performance counter, providing the Application
		/// Domain friendly name for the prefix for the instance.
		/// </summary>
		/// <param name="nameSuffix">Performance counter name, as defined during installation of the counter</param>
		/// <returns>Formatted instance name in form of "appDomainFriendlyName - nameSuffix"</returns>
		public string CreateName(string nameSuffix)
        {
			string appDomainFriendlyName = AppDomain.CurrentDomain.FriendlyName;
			PerformanceCounterInstanceName instanceName = new PerformanceCounterInstanceName(appDomainFriendlyName, nameSuffix);
			return instanceName.ToString();        	
        }
    }
}
