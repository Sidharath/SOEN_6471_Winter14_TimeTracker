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
using NarolaInfotech.Common.Configuration;
using NarolaInfotech.Data.Oracle;
using NarolaInfotech.Data.Oracle.Configuration;
using NarolaInfotech.Data.Configuration;

namespace NarolaInfotech.Data.Oracle
{
	internal class OracleDatabaseAssembler : IDatabaseAssembler
	{
		public Database Assemble(string name, ConnectionStringSettings connectionStringSettings, IConfigurationSource configurationSource)
		{
			OracleConnectionSettings oracleConnectionSettings = OracleConnectionSettings.GetSettings(configurationSource);
			if (oracleConnectionSettings != null)
			{
				OracleConnectionData oracleConnectionData = oracleConnectionSettings.OracleConnectionsData.Get(name);
				if (oracleConnectionData != null)
				{
					IOraclePackage[] packages = new IOraclePackage[oracleConnectionData.Packages.Count];
					int i = 0;
					foreach (IOraclePackage package in oracleConnectionData.Packages)
					{
						packages[i++] = package;
					}

					return new OracleDatabase(connectionStringSettings.ConnectionString, packages);
				}
			}

			return new OracleDatabase(connectionStringSettings.ConnectionString);
		}
	}
}
