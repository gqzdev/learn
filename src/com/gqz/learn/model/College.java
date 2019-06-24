package com.gqz.learn.model;
/**
 * 
* @ClassName: College
* @Description: TODO(这里用一句话描述这个类的作用)
* @author ganquanzhong
* @date 2019年3月5日 下午3:38:10
 */
public class College {
    private Integer id;

    private String name;

    private String state;

    private Integer isdel;

    private String intro;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro == null ? null : intro.trim();
    }
}