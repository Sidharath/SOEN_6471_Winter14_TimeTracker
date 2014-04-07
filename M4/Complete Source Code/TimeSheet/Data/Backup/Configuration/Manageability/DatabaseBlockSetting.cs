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
using System.Management.Instrumentation;

using NarolaInfotech.Common.Configuration.Manageability;

namespace NarolaInfotech.Data.Configuration.Manageability
{
	/// <summary>
	/// Represents the configuration information for the Database Application Block.
	/// </summary>
	/// <seealso cref="NarolaInfotech.Data.Configuration.DatabaseSettings"/>
	[InstrumentationClass(InstrumentationType.Instance)]
	public class DatabaseBlockSetting : ConfigurationSetting
	{
		private String defaultDatabase;

		internal DatabaseBlockSetting(String defaultDatabase)
		{
			this.defaultDatabase = defaultDatabase;
		}

		/// <summary>
		/// Gets the name of the default database on the represented database configuration section.
		/// </summary>
		/// <seealso cref="NarolaInfotech.Data.Configuration.DatabaseSettings.DefaultDatabase">DatabaseSettings.DefaultDatabase</seealso>
		public String DefaultDatabase
		{
			get { return defaultDatabase; }
			internal set { defaultDatabase = value; }
		}
	
	}
}
