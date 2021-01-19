﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLKARA.QuanLy.DatPhong
{
    public partial class DatPhongList1 : System.Web.UI.Page
    {
		KHDatPhong data = new KHDatPhong();
		protected void Page_Load(object sender, EventArgs e)
		{

			if (Session["TaiKhoan"] != null)
			{

			}
			else Response.Redirect("../../index.aspx");
			if (!IsPostBack)
				DanhSachDatPhong();
		}

		private void DanhSachDatPhong()
		{
			GV_DSDatPhong.DataSource = data.getdatphong1();
			DataBind();
		}
		int stt = 1;

		public string get_stt()

		{

			return Convert.ToString(stt++);

		}
		protected void GV_DSDatPhong_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
			GV_DSDatPhong.PageIndex = e.NewPageIndex;
			int trang_thu = e.NewPageIndex;
			int so_dong = GV_DSDatPhong.PageSize;
			stt = trang_thu * so_dong + 1;
			DanhSachDatPhong();
		}
    }
}