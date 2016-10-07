package dev.mvc.license;

import java.util.List;

public interface LicenseDAOInter {
  
  /**
   * 레코드를 등록합니다.
   * <insert id="create" parameterType="LicenseVO">
   * @param vo 등록할 데이터 객체
   * @return 등록된 레코드 수
   */
  public int create(LicenseVO vo);
  
  /**
   * 전체 목록
   * <select id="list" resultType="LicenseVO">
   * @return 회원 목록
   */
  public List<LicenseVO> list();
  
  
  /**
   * Code를 수정합니다.
   * <update id="update" parameterType="LicenseVO"> 
   * @param LicenseVO
   * @return 수정된 레코드 갯수
   */
  public int update(LicenseVO licenseVO);
}