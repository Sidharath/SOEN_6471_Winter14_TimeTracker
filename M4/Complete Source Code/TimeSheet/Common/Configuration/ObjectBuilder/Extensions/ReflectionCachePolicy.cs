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
using System.Text;

namespace NarolaInfotech.Common.Configuration.ObjectBuilder
{
	internal class ReflectionCachePolicy : IReflectionCachePolicy
	{
		private ConfigurationReflectionCache reflectionCache;

		internal ReflectionCachePolicy(ConfigurationReflectionCache reflectionCache)
		{
			this.reflectionCache = reflectionCache;
		}

		public ConfigurationReflectionCache ReflectionCache
		{
			get { return this.reflectionCache; }
		}
	}
}
