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
using System.Collections.Generic;
using System.Text;
using System.Configuration;
using System.Data.Common;
using NarolaInfotech.Common.Configuration;
using NarolaInfotech.Data.Configuration;

namespace NarolaInfotech.Data
{
	internal class GenericDatabaseAssembler : IDatabaseAssembler
	{
		public Database Assemble(string name, ConnectionStringSettings connectionStringSettings, IConfigurationSource configurationSource)
		{
			DbProviderFactory providerFactory = DbProviderFactories.GetFactory(connectionStringSettings.ProviderName);

			return new GenericDatabase(connectionStringSettings.ConnectionString, providerFactory);
		}
	}
}
