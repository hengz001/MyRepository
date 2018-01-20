package sino.java.serviceimpl.doc;

import org.springframework.stereotype.Service;
import sino.java.daoimpl.base.AbstractFinder;
import sino.java.po.doc.Document;
import sino.java.service.doc.DocumentServiceFind;

@Service("documentServiceFind")
public class DocumentServiceFindImpl extends AbstractFinder<Document> implements DocumentServiceFind{

}
