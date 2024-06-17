package com.smhrd.model;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class BannerDAO {
    SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

    public List<Banner> selectBannerData() {
        SqlSession session = sqlSessionFactory.openSession(true);
        List<Banner> results = session.selectList("com.smhrd.database.BannerMapper.selectBannerData");
        session.close();
        return results;
    }
}
