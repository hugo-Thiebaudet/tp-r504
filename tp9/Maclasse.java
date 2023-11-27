public class ClientUDP
{
	public static void main()
	{
		try {
				System.out.println( "nb args=" + args.length );
				for( int i=0; i<args.length; i++ )
				System.out.println( "args " + i + "=" + args[i] );
			}
			catch(Exception ex ) {
				system.out.println( "erreur !");
				ex.printStackTrace();
			}
	}
}
