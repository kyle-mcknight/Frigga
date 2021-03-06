/*
Copyright (c) 2010 Raul Bajales

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/
package json.frigga.report
{
	public class FriggaReport
	{
		private var messages : Vector.<FriggaMessage> = new Vector.<FriggaMessage>();
		
		public function FriggaReport(messages : Vector.<FriggaMessage>) {
			this.messages = messages;
		}
		
		public function isValid() : Boolean {
			return this.getMessages().length == 0;
		}
		
		public function getMessages() : Vector.<FriggaMessage> {
			return this.messages;
		}
		
		public function getMessagesAsString() : String {
			if (this.messages.length == 0) return "";
			var out : String = "Errors (message | property | actualValue): \n";
			for each (var msg : FriggaMessage in this.messages) 
				out += msg.message 
					+ ((msg.property != null) ? (" | " + msg.property) : "") 
					+ ((msg.actual != "") ? (" | " + msg.actual) : "") 
					+ "\n";
			return out;
		}
		
		public static function getWriter() : FriggaWriter {
			return new FriggaWriter();
		}
	}
}