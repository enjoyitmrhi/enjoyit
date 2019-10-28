package com.prj.enjoy.login.dao;

public class PageVO {
    private Integer displayRowCount = 10;           // 異쒕젰�븷 �뜲�씠�꽣 媛쒖닔
    private Integer rowStart;                       // �떆�옉�뻾踰덊샇
    private Integer rowEnd;                         // 醫낅즺�뻾 踰덊샇
    private Integer totPage;                        // �쟾泥� �럹�씠�닔
    private Integer totRow = 0;                     // �쟾泥� �뜲�씠�꽣 �닔
    private Integer page;                           // �쁽�옱 �럹�씠吏�
    private Integer pageStart;                      // �떆�옉�럹�씠吏�
    private Integer pageEnd;                        // 醫낅즺�럹�씠吏�

    /**
     * �쟾泥� �뜲�씠�꽣 媛쒖닔(total)瑜� �씠�슜�븯�뿬 �럹�씠吏��닔 怨꾩궛. 
     */
    public void pageCalculate(Integer total) {
        getPage();
        totRow  = total;
        totPage    = (int) ( total / displayRowCount );
        
        if ( total % displayRowCount > 0 ) {
            totPage++;
        }

        pageStart = (page - (page - 1) % displayRowCount) ;
        pageEnd = pageStart + 2;
        if (pageEnd > totPage) {
            pageEnd = totPage;
        }
        
        rowStart = ((page - 1) * displayRowCount) + 1 ;
        rowEnd   = rowStart + displayRowCount - 1;
    } 
    

    /**
     * �쁽�옱 �럹�씠吏� 踰덊샇. 
     */
    public Integer getPage() {
        if (page == null || page == 0) {
            page = 1;
        }
        
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getRowStart() {
        return rowStart;
    }

    public void setRowStart(Integer rowStart) {
        this.rowStart = rowStart;
    }

    public Integer getRowEnd() {
        return rowEnd;
    }

    public void setRowEnd(Integer rowEnd) {
        this.rowEnd = rowEnd;
    }

    public Integer getDisplayRowCount() {
        return displayRowCount;
    }

    public void setDisplayRowCount(Integer displayRowCount) {
        this.displayRowCount = displayRowCount;
    }

    public Integer getTotPage() {
        return totPage;
    }

    public void setTotPage(Integer totPage) {
        this.totPage = totPage;
    }

    public Integer getTotRow() {
        return totRow;
    }

    public void setTotRow(Integer totRow) {
        this.totRow = totRow;
    }

    public Integer getPageStart() {
        return pageStart;
    }

    public void setPageStart(Integer pageStart) {
        this.pageStart = pageStart;
    }

    public Integer getPageEnd() {
        return pageEnd;
    }

    public void setPageEnd(Integer pageEnd) {
        this.pageEnd = pageEnd;
    }


    
}


