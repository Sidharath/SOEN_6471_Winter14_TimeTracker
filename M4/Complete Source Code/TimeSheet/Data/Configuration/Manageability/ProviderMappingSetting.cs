//===============================================================================
// NarolaInfotech Support Data Library
// Data Access Application Block
//===============================================================================
// Copyright © NarolaInfotech.  All rights reserved.
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
	/// Represents the configuration information for a provider mapping defined by the Database Application Block
	/// configuration section.
	/// </summary>
	/// <seealso cref="NarolaInfotech.Data.Configuration.DatabaseSettings"/>
	/// <seealso cref="NarolaInfotech.Data.Configuration.DbProviderMapping"/>
	[InstrumentationClass(InstrumentationType.Instance)]
	public class ProviderMappingSetting : NamedConfigurationSetting
	{
		private String databaseTypeName;

		internal ProviderMappingSetting(String name, String databaseTypeName)
			: base(name)
		{
			this.databaseTypeName = databaseTypeName;
		}

		/// <summary>
		/// Gets the type of the database to which the represented database mapping 
		/// maps its provider name.
		/// </summary>
		public String DatabaseType
		{
			get { return databaseTypeName; }
			internal set { databaseTypeName = value; }
		}
	}
}
