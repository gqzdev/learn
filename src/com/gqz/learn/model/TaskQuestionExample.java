package com.gqz.learn.model;

import java.util.ArrayList;
import java.util.List;

public class TaskQuestionExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TaskQuestionExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andTitleIsNull() {
            addCriterion("title is null");
            return (Criteria) this;
        }

        public Criteria andTitleIsNotNull() {
            addCriterion("title is not null");
            return (Criteria) this;
        }

        public Criteria andTitleEqualTo(String value) {
            addCriterion("title =", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotEqualTo(String value) {
            addCriterion("title <>", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThan(String value) {
            addCriterion("title >", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThanOrEqualTo(String value) {
            addCriterion("title >=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThan(String value) {
            addCriterion("title <", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThanOrEqualTo(String value) {
            addCriterion("title <=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLike(String value) {
            addCriterion("title like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotLike(String value) {
            addCriterion("title not like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleIn(List<String> values) {
            addCriterion("title in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotIn(List<String> values) {
            addCriterion("title not in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleBetween(String value1, String value2) {
            addCriterion("title between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotBetween(String value1, String value2) {
            addCriterion("title not between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andItemAIsNull() {
            addCriterion("item_a is null");
            return (Criteria) this;
        }

        public Criteria andItemAIsNotNull() {
            addCriterion("item_a is not null");
            return (Criteria) this;
        }

        public Criteria andItemAEqualTo(String value) {
            addCriterion("item_a =", value, "itemA");
            return (Criteria) this;
        }

        public Criteria andItemANotEqualTo(String value) {
            addCriterion("item_a <>", value, "itemA");
            return (Criteria) this;
        }

        public Criteria andItemAGreaterThan(String value) {
            addCriterion("item_a >", value, "itemA");
            return (Criteria) this;
        }

        public Criteria andItemAGreaterThanOrEqualTo(String value) {
            addCriterion("item_a >=", value, "itemA");
            return (Criteria) this;
        }

        public Criteria andItemALessThan(String value) {
            addCriterion("item_a <", value, "itemA");
            return (Criteria) this;
        }

        public Criteria andItemALessThanOrEqualTo(String value) {
            addCriterion("item_a <=", value, "itemA");
            return (Criteria) this;
        }

        public Criteria andItemALike(String value) {
            addCriterion("item_a like", value, "itemA");
            return (Criteria) this;
        }

        public Criteria andItemANotLike(String value) {
            addCriterion("item_a not like", value, "itemA");
            return (Criteria) this;
        }

        public Criteria andItemAIn(List<String> values) {
            addCriterion("item_a in", values, "itemA");
            return (Criteria) this;
        }

        public Criteria andItemANotIn(List<String> values) {
            addCriterion("item_a not in", values, "itemA");
            return (Criteria) this;
        }

        public Criteria andItemABetween(String value1, String value2) {
            addCriterion("item_a between", value1, value2, "itemA");
            return (Criteria) this;
        }

        public Criteria andItemANotBetween(String value1, String value2) {
            addCriterion("item_a not between", value1, value2, "itemA");
            return (Criteria) this;
        }

        public Criteria andItemBIsNull() {
            addCriterion("item_b is null");
            return (Criteria) this;
        }

        public Criteria andItemBIsNotNull() {
            addCriterion("item_b is not null");
            return (Criteria) this;
        }

        public Criteria andItemBEqualTo(String value) {
            addCriterion("item_b =", value, "itemB");
            return (Criteria) this;
        }

        public Criteria andItemBNotEqualTo(String value) {
            addCriterion("item_b <>", value, "itemB");
            return (Criteria) this;
        }

        public Criteria andItemBGreaterThan(String value) {
            addCriterion("item_b >", value, "itemB");
            return (Criteria) this;
        }

        public Criteria andItemBGreaterThanOrEqualTo(String value) {
            addCriterion("item_b >=", value, "itemB");
            return (Criteria) this;
        }

        public Criteria andItemBLessThan(String value) {
            addCriterion("item_b <", value, "itemB");
            return (Criteria) this;
        }

        public Criteria andItemBLessThanOrEqualTo(String value) {
            addCriterion("item_b <=", value, "itemB");
            return (Criteria) this;
        }

        public Criteria andItemBLike(String value) {
            addCriterion("item_b like", value, "itemB");
            return (Criteria) this;
        }

        public Criteria andItemBNotLike(String value) {
            addCriterion("item_b not like", value, "itemB");
            return (Criteria) this;
        }

        public Criteria andItemBIn(List<String> values) {
            addCriterion("item_b in", values, "itemB");
            return (Criteria) this;
        }

        public Criteria andItemBNotIn(List<String> values) {
            addCriterion("item_b not in", values, "itemB");
            return (Criteria) this;
        }

        public Criteria andItemBBetween(String value1, String value2) {
            addCriterion("item_b between", value1, value2, "itemB");
            return (Criteria) this;
        }

        public Criteria andItemBNotBetween(String value1, String value2) {
            addCriterion("item_b not between", value1, value2, "itemB");
            return (Criteria) this;
        }

        public Criteria andItemCIsNull() {
            addCriterion("item_c is null");
            return (Criteria) this;
        }

        public Criteria andItemCIsNotNull() {
            addCriterion("item_c is not null");
            return (Criteria) this;
        }

        public Criteria andItemCEqualTo(String value) {
            addCriterion("item_c =", value, "itemC");
            return (Criteria) this;
        }

        public Criteria andItemCNotEqualTo(String value) {
            addCriterion("item_c <>", value, "itemC");
            return (Criteria) this;
        }

        public Criteria andItemCGreaterThan(String value) {
            addCriterion("item_c >", value, "itemC");
            return (Criteria) this;
        }

        public Criteria andItemCGreaterThanOrEqualTo(String value) {
            addCriterion("item_c >=", value, "itemC");
            return (Criteria) this;
        }

        public Criteria andItemCLessThan(String value) {
            addCriterion("item_c <", value, "itemC");
            return (Criteria) this;
        }

        public Criteria andItemCLessThanOrEqualTo(String value) {
            addCriterion("item_c <=", value, "itemC");
            return (Criteria) this;
        }

        public Criteria andItemCLike(String value) {
            addCriterion("item_c like", value, "itemC");
            return (Criteria) this;
        }

        public Criteria andItemCNotLike(String value) {
            addCriterion("item_c not like", value, "itemC");
            return (Criteria) this;
        }

        public Criteria andItemCIn(List<String> values) {
            addCriterion("item_c in", values, "itemC");
            return (Criteria) this;
        }

        public Criteria andItemCNotIn(List<String> values) {
            addCriterion("item_c not in", values, "itemC");
            return (Criteria) this;
        }

        public Criteria andItemCBetween(String value1, String value2) {
            addCriterion("item_c between", value1, value2, "itemC");
            return (Criteria) this;
        }

        public Criteria andItemCNotBetween(String value1, String value2) {
            addCriterion("item_c not between", value1, value2, "itemC");
            return (Criteria) this;
        }

        public Criteria andItemDIsNull() {
            addCriterion("item_d is null");
            return (Criteria) this;
        }

        public Criteria andItemDIsNotNull() {
            addCriterion("item_d is not null");
            return (Criteria) this;
        }

        public Criteria andItemDEqualTo(String value) {
            addCriterion("item_d =", value, "itemD");
            return (Criteria) this;
        }

        public Criteria andItemDNotEqualTo(String value) {
            addCriterion("item_d <>", value, "itemD");
            return (Criteria) this;
        }

        public Criteria andItemDGreaterThan(String value) {
            addCriterion("item_d >", value, "itemD");
            return (Criteria) this;
        }

        public Criteria andItemDGreaterThanOrEqualTo(String value) {
            addCriterion("item_d >=", value, "itemD");
            return (Criteria) this;
        }

        public Criteria andItemDLessThan(String value) {
            addCriterion("item_d <", value, "itemD");
            return (Criteria) this;
        }

        public Criteria andItemDLessThanOrEqualTo(String value) {
            addCriterion("item_d <=", value, "itemD");
            return (Criteria) this;
        }

        public Criteria andItemDLike(String value) {
            addCriterion("item_d like", value, "itemD");
            return (Criteria) this;
        }

        public Criteria andItemDNotLike(String value) {
            addCriterion("item_d not like", value, "itemD");
            return (Criteria) this;
        }

        public Criteria andItemDIn(List<String> values) {
            addCriterion("item_d in", values, "itemD");
            return (Criteria) this;
        }

        public Criteria andItemDNotIn(List<String> values) {
            addCriterion("item_d not in", values, "itemD");
            return (Criteria) this;
        }

        public Criteria andItemDBetween(String value1, String value2) {
            addCriterion("item_d between", value1, value2, "itemD");
            return (Criteria) this;
        }

        public Criteria andItemDNotBetween(String value1, String value2) {
            addCriterion("item_d not between", value1, value2, "itemD");
            return (Criteria) this;
        }

        public Criteria andAnswerIsNull() {
            addCriterion("answer is null");
            return (Criteria) this;
        }

        public Criteria andAnswerIsNotNull() {
            addCriterion("answer is not null");
            return (Criteria) this;
        }

        public Criteria andAnswerEqualTo(String value) {
            addCriterion("answer =", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerNotEqualTo(String value) {
            addCriterion("answer <>", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerGreaterThan(String value) {
            addCriterion("answer >", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerGreaterThanOrEqualTo(String value) {
            addCriterion("answer >=", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerLessThan(String value) {
            addCriterion("answer <", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerLessThanOrEqualTo(String value) {
            addCriterion("answer <=", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerLike(String value) {
            addCriterion("answer like", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerNotLike(String value) {
            addCriterion("answer not like", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerIn(List<String> values) {
            addCriterion("answer in", values, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerNotIn(List<String> values) {
            addCriterion("answer not in", values, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerBetween(String value1, String value2) {
            addCriterion("answer between", value1, value2, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerNotBetween(String value1, String value2) {
            addCriterion("answer not between", value1, value2, "answer");
            return (Criteria) this;
        }

        public Criteria andTaskIdIsNull() {
            addCriterion("task_id is null");
            return (Criteria) this;
        }

        public Criteria andTaskIdIsNotNull() {
            addCriterion("task_id is not null");
            return (Criteria) this;
        }

        public Criteria andTaskIdEqualTo(Integer value) {
            addCriterion("task_id =", value, "taskId");
            return (Criteria) this;
        }

        public Criteria andTaskIdNotEqualTo(Integer value) {
            addCriterion("task_id <>", value, "taskId");
            return (Criteria) this;
        }

        public Criteria andTaskIdGreaterThan(Integer value) {
            addCriterion("task_id >", value, "taskId");
            return (Criteria) this;
        }

        public Criteria andTaskIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("task_id >=", value, "taskId");
            return (Criteria) this;
        }

        public Criteria andTaskIdLessThan(Integer value) {
            addCriterion("task_id <", value, "taskId");
            return (Criteria) this;
        }

        public Criteria andTaskIdLessThanOrEqualTo(Integer value) {
            addCriterion("task_id <=", value, "taskId");
            return (Criteria) this;
        }

        public Criteria andTaskIdIn(List<Integer> values) {
            addCriterion("task_id in", values, "taskId");
            return (Criteria) this;
        }

        public Criteria andTaskIdNotIn(List<Integer> values) {
            addCriterion("task_id not in", values, "taskId");
            return (Criteria) this;
        }

        public Criteria andTaskIdBetween(Integer value1, Integer value2) {
            addCriterion("task_id between", value1, value2, "taskId");
            return (Criteria) this;
        }

        public Criteria andTaskIdNotBetween(Integer value1, Integer value2) {
            addCriterion("task_id not between", value1, value2, "taskId");
            return (Criteria) this;
        }

        public Criteria andScoreIsNull() {
            addCriterion("score is null");
            return (Criteria) this;
        }

        public Criteria andScoreIsNotNull() {
            addCriterion("score is not null");
            return (Criteria) this;
        }

        public Criteria andScoreEqualTo(Integer value) {
            addCriterion("score =", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreNotEqualTo(Integer value) {
            addCriterion("score <>", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreGreaterThan(Integer value) {
            addCriterion("score >", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreGreaterThanOrEqualTo(Integer value) {
            addCriterion("score >=", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreLessThan(Integer value) {
            addCriterion("score <", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreLessThanOrEqualTo(Integer value) {
            addCriterion("score <=", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreIn(List<Integer> values) {
            addCriterion("score in", values, "score");
            return (Criteria) this;
        }

        public Criteria andScoreNotIn(List<Integer> values) {
            addCriterion("score not in", values, "score");
            return (Criteria) this;
        }

        public Criteria andScoreBetween(Integer value1, Integer value2) {
            addCriterion("score between", value1, value2, "score");
            return (Criteria) this;
        }

        public Criteria andScoreNotBetween(Integer value1, Integer value2) {
            addCriterion("score not between", value1, value2, "score");
            return (Criteria) this;
        }

        public Criteria andStateIsNull() {
            addCriterion("state is null");
            return (Criteria) this;
        }

        public Criteria andStateIsNotNull() {
            addCriterion("state is not null");
            return (Criteria) this;
        }

        public Criteria andStateEqualTo(String value) {
            addCriterion("state =", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotEqualTo(String value) {
            addCriterion("state <>", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateGreaterThan(String value) {
            addCriterion("state >", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateGreaterThanOrEqualTo(String value) {
            addCriterion("state >=", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateLessThan(String value) {
            addCriterion("state <", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateLessThanOrEqualTo(String value) {
            addCriterion("state <=", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateLike(String value) {
            addCriterion("state like", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotLike(String value) {
            addCriterion("state not like", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateIn(List<String> values) {
            addCriterion("state in", values, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotIn(List<String> values) {
            addCriterion("state not in", values, "state");
            return (Criteria) this;
        }

        public Criteria andStateBetween(String value1, String value2) {
            addCriterion("state between", value1, value2, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotBetween(String value1, String value2) {
            addCriterion("state not between", value1, value2, "state");
            return (Criteria) this;
        }

        public Criteria andIsdelIsNull() {
            addCriterion("isDel is null");
            return (Criteria) this;
        }

        public Criteria andIsdelIsNotNull() {
            addCriterion("isDel is not null");
            return (Criteria) this;
        }

        public Criteria andIsdelEqualTo(Integer value) {
            addCriterion("isDel =", value, "isdel");
            return (Criteria) this;
        }

        public Criteria andIsdelNotEqualTo(Integer value) {
            addCriterion("isDel <>", value, "isdel");
            return (Criteria) this;
        }

        public Criteria andIsdelGreaterThan(Integer value) {
            addCriterion("isDel >", value, "isdel");
            return (Criteria) this;
        }

        public Criteria andIsdelGreaterThanOrEqualTo(Integer value) {
            addCriterion("isDel >=", value, "isdel");
            return (Criteria) this;
        }

        public Criteria andIsdelLessThan(Integer value) {
            addCriterion("isDel <", value, "isdel");
            return (Criteria) this;
        }

        public Criteria andIsdelLessThanOrEqualTo(Integer value) {
            addCriterion("isDel <=", value, "isdel");
            return (Criteria) this;
        }

        public Criteria andIsdelIn(List<Integer> values) {
            addCriterion("isDel in", values, "isdel");
            return (Criteria) this;
        }

        public Criteria andIsdelNotIn(List<Integer> values) {
            addCriterion("isDel not in", values, "isdel");
            return (Criteria) this;
        }

        public Criteria andIsdelBetween(Integer value1, Integer value2) {
            addCriterion("isDel between", value1, value2, "isdel");
            return (Criteria) this;
        }

        public Criteria andIsdelNotBetween(Integer value1, Integer value2) {
            addCriterion("isDel not between", value1, value2, "isdel");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}