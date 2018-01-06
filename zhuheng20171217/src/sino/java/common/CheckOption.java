package sino.java.common;

import sino.java.service.impower.ImpowerServiceFinder;

public class CheckOption {
	
	private static ImpowerServiceFinder imf;

	public static ImpowerServiceFinder getImf() {
		return imf;
	}

	public static void setImf(ImpowerServiceFinder imf) {
		CheckOption.imf = imf;
	}

	public static boolean hasOption(int u_id,String m_name,String str){
		boolean flag = false;
		flag = imf.hasOptionAt(u_id, m_name, str);
		return flag;
	}
}
