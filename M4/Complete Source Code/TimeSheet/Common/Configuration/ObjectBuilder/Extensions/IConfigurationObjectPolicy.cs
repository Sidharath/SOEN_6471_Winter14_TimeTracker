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

using Microsoft.Practices.ObjectBuilder;

namespace NarolaInfotech.Common.Configuration.ObjectBuilder
{
	/// <summary>
	/// Represents a policy that will provide an <see cref="IConfigurationSource"/>.
	/// </summary>
	/// <remarks>
	/// This policy will be used by strategies that need to access a configuration source.
	/// </remarks>
	public interface IConfigurationObjectPolicy : IBuilderPolicy
	{
		/// <summary>
		/// Gets the configuration source.
		/// </summary>
		IConfigurationSource ConfigurationSource { get; }
	}
}
