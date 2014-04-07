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
namespace NarolaInfotech.Common.Configuration.Manageability
{
	interface IGroupPolicyWatcher : IDisposable
	{
		event GroupPolicyUpdateDelegate GroupPolicyUpdated;
		void StartWatching();
		void StopWatching();
	}

	internal delegate void GroupPolicyUpdateDelegate(bool machine);
}