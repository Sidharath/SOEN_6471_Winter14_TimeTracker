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

namespace NarolaInfotech.Common.Configuration.ObjectBuilder
{
	/// <summary>
	/// Responsible for binding attributed events in a source object to attributed handler methods in 
	/// a listener object.
	/// </summary>
	public interface IInstrumentationAttacher
	{
		/// <summary>
		/// Binds events from source object to appropriate handler methods in listener object.
		/// </summary>
		void BindInstrumentation();
	}
}