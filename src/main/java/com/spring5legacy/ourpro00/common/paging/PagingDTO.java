package com.spring5legacy.ourpro00.common.paging;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@ToString
@Setter
public class PagingDTO {

		private Integer pageNum;
		private Integer rowAmountPerPage;
		
		private String scope;  //검색범위(scope - T:btitle, C:bcontent, W:bwriter J:BOCCUPATION R:bregion)
		private String scopeDate;
		private String keyword;
		
		
		public PagingDTO() {
			this.pageNum = 1;
			this.rowAmountPerPage = 20;
		}
		
		public void setPageNum(Integer pageNum) {
				if(pageNum ==null||pageNum <= 0) {
				this.pageNum = 1;
			} else {
				this.pageNum=pageNum;
			}
		}

		public void setRowAmountPerPage(Integer rowAmountPerPage) {
				if(rowAmountPerPage == null||rowAmountPerPage <= 0) {
				this.rowAmountPerPage = 20;
			} else {
				this.rowAmountPerPage=rowAmountPerPage;
			}
		}

		public void setScope(String scope) {
			this.scope = scope;
		}

		public void setKeyword(String keyword) {
			this.keyword = keyword;
		}

		public void setEndDate(String scopeDate) {
			this.scopeDate = scopeDate;
		}

		
		
		//검색범위 값 처리를 위한 메소드: 화면에서 선택된 TCW 값을 ["T", "C", "W"] 배열로 반환 
		//이 메서드는 Mybatis 엔진에 의해서 자동으로 호출되어 사용됨(SQL 매퍼 파일의 SELECT문에서 설명함)
		//[주의] 메서드 이름이 "Getter 의 이름 지정 방식"을 준수해야 함
		
		@SuppressWarnings("unused")
		private String[] getScopeArray() {
			return scope == null ? new String[] {}: scope.split("");
		}
		
		public String addPagingParamsToURI () {
		    UriComponentsBuilder uriBuilder =
		        UriComponentsBuilder.fromPath("")
		                              .queryParam("pageNum", this.pageNum)
		                              .queryParam("rowAmountPerPage", this.rowAmountPerPage)
		                              .queryParam("scope", this.scope)
		                              .queryParam("keyword", this.keyword)
		                              .queryParam("scopeDate", this.scopeDate); 
		    
		    String uriString = uriBuilder.toUriString();
		    System.out.println("생성된 파라미터 추가 URI String: " + uriString);
		    return uriString;
		}

	}


