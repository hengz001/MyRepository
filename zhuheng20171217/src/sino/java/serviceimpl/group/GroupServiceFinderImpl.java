package sino.java.serviceimpl.group;

import org.springframework.stereotype.Service;

import sino.java.daoimpl.base.AbstractFinder;
import sino.java.po.group.Group;
import sino.java.service.group.GroupServiceFinder;

@Service("groupServiceFinder")
public class GroupServiceFinderImpl extends AbstractFinder<Group> implements GroupServiceFinder{

}
