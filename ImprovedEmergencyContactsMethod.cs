public async Task<ResponseData> IuEmergencyInformationContacts(
    List<UserEmergencyInformationContactCreate> userEmergencyInformation, string userId)
{
    var response = new ResponseData();

    await using var db = new ApplicationDbContext();

    // Use a transaction for data consistency
    using var transaction = await db.Database.BeginTransactionAsync();
    
    try
    {
        var existingEmergencyInformation = await db.UserEmergencyInformations
            .FirstOrDefaultAsync(s => s.UserId == userId);

        if (existingEmergencyInformation == null)
            return new ResponseData
            {
                Response = ResponseStatus.Error,
                Message = "No emergency info found for this user."
            };

        var parentId = existingEmergencyInformation.Id;
        
        if (userEmergencyInformation.Any())
        {
            // Delete all existing contacts for that parent
            var oldContacts = await db.UserEmergencyInformationContacts
                .Where(c => c.UserEmergencyInformationId == parentId)
                .ToListAsync();
            
            if (oldContacts.Any())
                db.UserEmergencyInformationContacts.RemoveRange(oldContacts);

            // Build and add the new contacts, all tied to parentId
            var emergencyInformationContacts = userEmergencyInformation.Select(s =>
                new UserEmergencyInformationContact
                {
                    ContactNumber = s.ContactNumber,
                    ContactType = s.ContactType,
                    CountryCode = s.CountryCode,
                    CreatedAt = DateTime.UtcNow,
                    CreatedBy = userId,
                    Id = Guid.NewGuid().ToString(),
                    Extension = s.Extension,
                    UserEmergencyInformationId = parentId
                }).ToList();

            db.UserEmergencyInformationContacts.AddRange(emergencyInformationContacts);

            await db.SaveChangesAsync();
            await transaction.CommitAsync();

            response = new ResponseData
            {
                Response = ResponseStatus.Success,
                Message = "Contacts updated successfully!"
            };
        }
        else
        {
            // Handle case where no contacts are provided - just delete existing ones
            var oldContacts = await db.UserEmergencyInformationContacts
                .Where(c => c.UserEmergencyInformationId == parentId)
                .ToListAsync();
            
            if (oldContacts.Any())
            {
                db.UserEmergencyInformationContacts.RemoveRange(oldContacts);
                await db.SaveChangesAsync();
            }
            
            await transaction.CommitAsync();

            response = new ResponseData
            {
                Response = ResponseStatus.Success,
                Message = "All contacts removed successfully!"
            };
        }
    }
    catch (Exception ex)
    {
        await transaction.RollbackAsync();
        response = new ResponseData
        {
            Response = ResponseStatus.Error,
            Message = "Failed to update contacts: " + ex.Message
        };
    }

    return response;
}