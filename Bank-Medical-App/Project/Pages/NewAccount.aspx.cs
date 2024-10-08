﻿using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_NewAccount : System.Web.UI.Page
{
    // Assuming you're using a LINQ to SQL DataContext or Entity Framework DbContext
    NewAccountDataClassesDataContext db = new NewAccountDataClassesDataContext("");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Populate departments dropdown list
            BindDepartments();
        }
    }

    private void BindDepartments()
    {
        try
        {
            // Fetch departments from the database
            var departments = db.Departments.ToList();

            // Bind departments to the dropdown list
            ddl_Departments.DataSource = departments;
            ddl_Departments.DataTextField = "DepartmentName"; // Replace with the actual name field in your database
            ddl_Departments.DataValueField = "DepartmentID";  // Replace with the actual ID field in your database
            ddl_Departments.DataBind();

            // Optionally add a "Select Department" option
            ddl_Departments.Items.Insert(0, new ListItem("Select Department", "-1"));
        }
        catch (Exception ex)
        {
            // Handle any exceptions that occur during data binding
            // Log the error and optionally show a message to the user
            Console.WriteLine("Error binding departments: " + ex.Message);
        }
    }

    protected void btn_addDoctor_Click(object sender, EventArgs e)
    {
        try
        {
            // Retrieve MFID from session
            int mfid = GetMedicalFieldID();

            if (mfid > 0)
            {
                // Create a new doctor object
                Doctor doctor_obj = new Doctor
                {
                    DoctorName = txt_doctor_name.Text,
                    Price = Convert.ToDecimal(txt_price.Text),
                    Username = username.Text,
                    DoctorPassword = password.Text,
                    Mobile = Convert.ToInt64(txt_mobile.Text),
                    Position = ddl_postion.SelectedItem.Text,
                    //DepartmentID = Convert.ToInt32(ddl_Departments.SelectedValue), // Get the selected department ID
                    MFID = mfid // Use MFID retrieved from session
                };

                if (ddl_postion.SelectedValue != "3") // If the position is not "Analysis"
                {
                    doctor_obj.DepartmentID = Convert.ToInt32(ddl_Departments.SelectedValue);
                }
                else
                {
                    ddl_Departments.SelectedIndex = -1; // Clear the selection
                    ddl_Departments.Enabled = false; // Disable the dropdown
                }

                // Insert the new doctor into the database
                db.Doctors.InsertOnSubmit(doctor_obj);
                db.SubmitChanges();

                // Show success message using Toastify
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Doctor Add successfully.');", true);
            }
            else
            {
                // Show error message if MFID is not found
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: Unable to retrieve Medical Field ID.');", true);
            }
        }
        catch (Exception ex)
        {
            // Show error message using Toastify
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error adding doctor. Please try again.');", true);
        }
    }
    protected void btn_reset_Click(object sender, EventArgs e)
    {
        // Clear all the TextBox and DropDownList fields
        txt_doctor_name.Text = string.Empty;
        txt_price.Text = string.Empty;
        txt_mobile.Text = string.Empty;
        username.Text = string.Empty;
        password.Text = string.Empty;
        ddl_postion.SelectedIndex = -1;  // Reset position dropdown
        ddl_Departments.SelectedIndex = -1;  // Reset department dropdown

        // Optional: Reset any additional form fields or variables if necessary
    }


    private int GetMedicalFieldID()
    {
        // Retrieve the MFID from the session
        MedicalField obj_MedicalField = (MedicalField)Session["MedicalFieldAccount"];


            return obj_MedicalField.MFID;
    }
}
