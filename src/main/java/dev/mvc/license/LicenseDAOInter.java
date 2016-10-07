package dev.mvc.license;

import java.util.List;

public interface LicenseDAOInter {
  
  /**
   * ���ڵ带 ����մϴ�.
   * <insert id="create" parameterType="LicenseVO">
   * @param vo ����� ������ ��ü
   * @return ��ϵ� ���ڵ� ��
   */
  public int create(LicenseVO vo);
  
  /**
   * ��ü ���
   * <select id="list" resultType="LicenseVO">
   * @return ȸ�� ���
   */
  public List<LicenseVO> list();
  
  
  /**
   * Code�� �����մϴ�.
   * <update id="update" parameterType="LicenseVO"> 
   * @param LicenseVO
   * @return ������ ���ڵ� ����
   */
  public int update(LicenseVO licenseVO);
}