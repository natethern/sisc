/*
 * Created on Jun 3, 2003
 *
 * To change the template for this generated file go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
package sisc.io;

import java.io.IOException;

/**
 * @author scgmille
 *
 * To change the template for this generated type comment go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
public interface CharacterInputPort extends InputPort {

	/**
	 * Character ports support block reading of possibly multibyte characters.
	 * 
	 * @param cbuf Destination character buffer
	 * @param offset Offset into the buffer
	 * @param count Number of characters to read
	 * @throws IOException
	 */
	void read(char[] cbuf, int offset, int count) throws IOException;
	
}
