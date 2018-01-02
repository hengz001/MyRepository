package sino.java.serviceimpl.impower;

import org.springframework.stereotype.Service;

import sino.java.daoimpl.base.AbstractFinder;
import sino.java.po.impower.Impower;
import sino.java.service.impower.ImpowerServiceFinder;

@Service("impowerServiceFinder")
public class ImpowerServiceFinderImpl extends AbstractFinder<Impower> implements ImpowerServiceFinder{

}
