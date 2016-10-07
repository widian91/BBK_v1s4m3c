package dev.mvc.license;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 
@Repository("dev.mvc.license.LicenseDAO")
public class LicenseDAO implements LicenseDAOInter{
  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS 3 ¿¬°á °´Ã¼

  public LicenseDAO(){
    System.out.println("--> LicenseDAO created.");  
  }
  
  @Override
  public int create(LicenseVO vo) {
    return mybatis.insert("license.create", vo);
  }
  
  @Override
  public List<LicenseVO> list() {
    return mybatis.selectList("license.list");
  }
  
  @Override
  public int update(LicenseVO licenseVO) {
    return mybatis.update("license.update", licenseVO);
  }
}